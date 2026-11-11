#pragma once

#include "Process.h"
#include <unordered_map>

class ProcessManager {
  private:
    std::unordered_map<int, Process> processes;

    // maps pid to process
  public:
    void addProcess(const Process &process);
    const std::unordered_map<int, Process> &getProcesses() const;
};
