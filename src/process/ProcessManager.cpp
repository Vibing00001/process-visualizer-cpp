#include "ProcessManager.h"
#include "CpuStuff.h"
#include <algorithm>
#include <chrono>
#include <cmath>
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
    for (LayoutSlot &slot : layoutSlots) {
        if (snapshot.contains(slot.pid)) {
            placed.insert(slot.pid);
        } else {
            slot.pid = 0;
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
    for (LayoutSlot &slot : layoutSlots) {
        if (slot.pid == 0 && nextPid != newPids.end()) {
            slot.pid = *nextPid++;
        }
    }
    while (nextPid != newPids.end()) {
        layoutSlots.push_back({*nextPid++, nextLayoutPosition()});
    }
    while (!layoutSlots.empty() && layoutSlots.back().pid == 0) {
        layoutSlots.pop_back();
    }

    for (const LayoutSlot &slot : layoutSlots) {
        if (slot.pid != 0) {
            snapshot.at(slot.pid).pos = slot.position;
        }
    }
}

Vector3 ProcessManager::nextLayoutPosition() {
    if (layoutSlots.empty()) {
        return {}; // The first slot usually belongs to PID 1.
    }

    // Grow the volume in proportion to the number of slots and leave space
    // between spheres, including slots that may be reused on a later refresh.
    constexpr float spacing = 4.0f;
    float radius = std::max(
        8.0f, 5.0f * std::cbrt(static_cast<float>(layoutSlots.size())));
    std::uniform_real_distribution<float> coordinate(-radius, radius);
    for (;;) {
        Vector3 position{coordinate(layoutRandom), coordinate(layoutRandom),
                         coordinate(layoutRandom)};
        float distanceSquared = position.x * position.x + position.y * position.y +
                                position.z * position.z;
        if (distanceSquared > radius * radius) {
            continue;
        }
        bool tooClose = std::any_of(
            layoutSlots.begin(), layoutSlots.end(), [&](const LayoutSlot &slot) {
                float dx = position.x - slot.position.x;
                float dy = position.y - slot.position.y;
                float dz = position.z - slot.position.z;
                return dx * dx + dy * dy + dz * dz < spacing * spacing;
            });
        if (!tooClose) {
            return position;
        }
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
