#include "ProcessManager.h"
#include <filesystem>
#include <iostream>
#include <system_error>
#include <unordered_set>
void ProcessManager::addProcess(const Process &process) {
    this->processes.insert_or_assign(process.pid, process);
}

const std::unordered_map<int, Process> &ProcessManager::getProcesses() const {
    return this->processes;
}

#define DEBUG 1

void ProcessManager::getPath(const fs::path &filePath) const {
    std::error_code ec;
    fs::directory_iterator it(filePath, ec);

    if (ec) {
        std::cerr << "Error opening " << filePath << ": " << ec.message()
                  << '\n';
        return;
    }

    for (const auto &entry : it) {
        std::string fileName = entry.path().filename().string();
        if (!checkNumeric(fileName)) {
            continue;
        }

        if (DEBUG) {
            std::cout << fileName << "\n";
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
