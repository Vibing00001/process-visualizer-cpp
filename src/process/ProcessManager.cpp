#include "ProcessManager.h"
#include "CpuStuff.h"
#include <algorithm>
#include <chrono>
#include <filesystem>
#include <fstream>
#include <iostream>
#include <memory>
#include <mutex>
#include <sstream>
#include <system_error>
#include <unordered_set>

namespace fs = std::filesystem;

ProcessManager::ProcessManager() {
    worker = std::jthread(
        [this](std::stop_token stopToken) { workerLoop(stopToken); });
}

void ProcessManager::workerLoop(std::stop_token stopToken) {
    while (!stopToken.stop_requested()) {
        updateProcesses();

        std::unique_lock<std::mutex> lock(sleepMutex);

        cv.wait_for(lock, stopToken, std::chrono::seconds(1),
                    [] { return false; });
    }
}

std::shared_ptr<const ProcessMap> ProcessManager::getProcesses() {
    std::lock_guard<std::mutex> lock(mutex);
    return processes;
}

void ProcessManager::updateProcesses() {
    const fs::path filePath{"/proc"};
    std::error_code ec;
    fs::directory_iterator it(filePath, ec);
    if (ec) {
        std::cerr << "Error opening " << filePath << ": " << ec.message()
                  << '\n';
        return;
    }
    // TODO: Implement CPU usage and process storage
    auto newSnapShot = std::make_shared<ProcessMap>();
    for (const auto &entry : it) {
        std::string fileName = entry.path().filename().string();

        if (!checkNumeric(fileName)) {
            continue;
        }

        fs::path statusPath = entry.path() / "status";
        std::ifstream file(statusPath);

        // Process may have terminated while scanning
        if (!file) {
            continue;
        }

        std::string line;
        std::string name;
        std::string pid;
        std::string ppid;
        std::string memory;

        while (std::getline(file, line)) {
            std::istringstream iss(line);

            std::string key;
            std::string value;

            iss >> key >> value;

            if (key == "Name:") {
                name = value;
            } else if (key == "Pid:") {
                pid = value;
            } else if (key == "PPid:") {
                ppid = value;
            } else if (key == "VmRSS:") {
                memory = value;
            }
        }

        if (pid.empty() || ppid.empty()) {
            continue;
        }

        float memoryMB = 0.0f;

        if (!memory.empty()) {
            memoryMB = std::stof(memory) / 1024.0f;
        }

        int processId = std::stoi(pid);
        float cpuUsage =
            static_cast<float>(cpuCalculator.getCpuUsage(processId));

        newSnapShot->emplace(
            processId,
            Process{processId, std::stoi(ppid), name, {}, cpuUsage, memoryMB});
    }

    positionProcesses(*newSnapShot);
    cpuCalculator.cleanup(*newSnapShot);
    {
        std::lock_guard<std::mutex> lock(mutex);
        processes = newSnapShot;
    }
}

void ProcessManager::positionProcesses(ProcessMap &snapshot) {
    std::unordered_set<int> placed;
    for (int &pid : layoutSlots) {
        if (snapshot.contains(pid)) {
            placed.insert(pid);
        } else {
            pid = 0; // An empty slot left by an exited process.
        }
    }

    std::vector<int> newPids;
    for (const auto &[pid, process] : snapshot) {
        if (!placed.contains(pid)) {
            newPids.push_back(pid);
        }
    }
    std::sort(newPids.begin(), newPids.end());

    auto nextPid = newPids.begin();
    for (int &pid : layoutSlots) {
        if (pid == 0 && nextPid != newPids.end()) {
            pid = *nextPid++;
        }
    }
    layoutSlots.insert(layoutSlots.end(), nextPid, newPids.end());
    while (!layoutSlots.empty() && layoutSlots.back() == 0) {
        layoutSlots.pop_back();
    }

    // Walk a square spiral so adding an outer slot leaves existing nodes in
    // place.
    constexpr float spacing = 4.0f;
    int x = 0;
    int z = 0;
    int stepX = 0;
    int stepZ = -1;
    for (int pid : layoutSlots) {
        if (pid != 0) {
            snapshot.at(pid).pos = {x * spacing, 0.0f, z * spacing};
        }
        if (x == z || (x < 0 && x == -z) || (x > 0 && x == 1 - z)) {
            int previousStepX = stepX;
            stepX = -stepZ;
            stepZ = previousStepX;
        }
        x += stepX;
        z += stepZ;
    }
}

bool ProcessManager::checkNumeric(const std::string &procName) const {
    std::unordered_set<char> nums = {'0', '1', '2', '3', '4',
                                     '5', '6', '7', '8', '9'};

    if (procName.empty())
        return false;

    for (char c : procName) {
        if (!nums.contains(c))
            return false;
    }

    return true;
}

#ifdef PROCESS_MANAGER_TEST
int main() {
    ProcessManager manager;

    manager.getPath("/proc");
}
#endif
