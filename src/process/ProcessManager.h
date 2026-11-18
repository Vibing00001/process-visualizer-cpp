#pragma once

#include "Process.h"
#include "CpuStuff.h"
#include <filesystem>
#include <unordered_map>
#include <utility>
#include <vector>

namespace fs = std::filesystem;

class ProcessManager {
  private:
    std::unordered_map<int, Process> processes;
    CalculateCPU cpuCalculator;
    bool checkNumeric(const std::string &procName) const;

    // maps pid to process
  public:
    void addProcess(const Process &process);
    void removeProcess(int pid);
    void updateCpuUsage();
    const std::unordered_map<int, Process> &getProcesses() const;
    void getPath(const fs::path &filePath) const;
};
