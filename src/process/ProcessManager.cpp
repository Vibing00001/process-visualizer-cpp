#include "ProcessManager.h"
#include <algorithm>
#include <filesystem>
#include <fstream>
#include <iostream>
#include <sstream>
#include <system_error>

void ProcessManager::addProcess(const Process &process) {
    this->processes.insert_or_assign(process.pid, process);
}

const std::unordered_map<int, Process> &ProcessManager::getProcesses() const {
    return this->processes;
}

void ProcessManager::getPath(const fs::path &filePath) {
    std::error_code ec;
    fs::directory_iterator it(filePath, ec);

    if (ec) {
        std::cerr << "Error opening " << filePath << ": " << ec.message()
                  << '\n';
        return;
    }

    std::unordered_map<int, Process> refreshed;
    const fs::directory_iterator end;
    for (; it != end; it.increment(ec)) {
        if (ec) {
            break;
        }
        const auto &entry = *it;
        std::string fileName = entry.path().filename().string();
        if (!checkNumeric(fileName)) {
            continue;
        }
        std::string line;
        std::ifstream file(entry.path() / "status");
        if (!file.is_open()) {
            continue; // Processes may exit during the scan.
        }
        Process process{};
        bool hasName = false;
        bool hasPid = false;
        bool hasParent = false;
        while (std::getline(file, line)) {
            std::istringstream iss(line);

            std::string key;
            iss >> key;

            if (key == "Name:") {
                std::getline(iss >> std::ws, process.name);
                hasName = !process.name.empty();
            } else if (key == "Pid:") {
                hasPid = static_cast<bool>(iss >> process.pid);
            } else if (key == "PPid:") {
                hasParent = static_cast<bool>(iss >> process.ppid);
            } else if (key == "VmRSS:") {
                float memoryKB;
                if (iss >> memoryKB && memoryKB >= 0.0f) {
                    process.memoryMB = memoryKB / 1024.0f;
                }
            }
        }
        if (file.bad() || !hasName || !hasPid || !hasParent ||
            process.pid <= 0 || std::to_string(process.pid) != fileName) {
            continue;
        }
        // Keep renderer placement when updating an existing process.
        auto previous = processes.find(process.pid);
        if (previous != processes.end()) {
            process.pos = previous->second.pos;
        }
        refreshed.insert_or_assign(process.pid, process);
    }

    if (ec) {
        std::cerr << "Error scanning " << filePath << ": " << ec.message()
                  << '\n';
        return;
    }

    for (auto &[pid, process] : refreshed) {
        process.cpuUsage = static_cast<float>(cpuCalculator.getCpuUsage(pid));
    }
    for (const auto &[pid, process] : processes) {
        if (!refreshed.contains(pid)) {
            cpuCalculator.forgetProcess(pid);
        }
    }
    processes = std::move(refreshed);
}

bool ProcessManager::checkNumeric(const std::string &procName) const {
    return !procName.empty() &&
           std::all_of(procName.begin(), procName.end(),
                       [](char c) { return c >= '0' && c <= '9'; });
}

#ifdef PROCESS_MANAGER_TEST
int main() {
    ProcessManager manager;

    manager.getPath("/proc");
}
#endif
