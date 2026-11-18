#pragma once

#include "Process.h"
#include "CpuStuff.h"
#include <filesystem>
#include <unordered_map>

namespace fs = std::filesystem;

class ProcessManager {
  private:
    std::unordered_map<int, Process> processes;
    CalculateCPU cpuCalculator;
    bool checkNumeric(const std::string &procName) const;

    // maps pid to process
  public:
    void addProcess(const Process &process);
    const std::unordered_map<int, Process> &getProcesses() const;
    // Refresh from a proc directory; preserve the current list if scanning fails.
    void getPath(const fs::path &filePath);
};
