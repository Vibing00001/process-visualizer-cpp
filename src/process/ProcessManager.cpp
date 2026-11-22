#include "ProcessManager.h"
#include "CpuStuff.h"
#include <filesystem>
#include <fstream>
#include <iostream>
#include <memory>
#include <mutex>
#include <sstream>
#include <system_error>
#include <unordered_set>

namespace fs = std::filesystem;

std::shared_ptr<const ProcessMap> ProcessManager::getProcesses(){
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

        // too long to check if its valid or not.
        float cpuUsage =
            static_cast<float>(cpuCalculator.getCpuUsage(std::stoi(pid)));

        Process process{std::stoi(pid),     std::stoi(ppid), name,
                        {0.0f, 0.0f, 0.0f}, cpuUsage,        std::stof(memory)};

        newSnapShot->emplace(std::stoi(pid), process);
    }

    cpuCalculator.cleanup(*newSnapShot);
    {
        std::lock_guard<std::mutex> lock(mutex);
        processes = newSnapShot;
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
