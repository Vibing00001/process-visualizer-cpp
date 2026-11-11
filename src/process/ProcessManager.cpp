#include "ProcessManager.h"

void ProcessManager::addProcess(const Process &process) {
    this->processes.insert_or_assign(process.pid, process);
}

const std::unordered_map<int, Process> &ProcessManager::getProcesses() const {
    return this->processes;
}
