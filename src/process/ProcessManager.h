#pragma once

#include "CpuStuff.h"
#include "Process.h"
#include <filesystem>
#include <thread>
#include <unordered_map>
#include <utility>
#include <vector>

using ProcessMap = std::unordered_map<int, Process>;

class ProcessManager {
  private:
    // ProcessMap processes;
    CalculateCPU cpuCalculator;
    bool checkNumeric(const std::string &procName) const;
    std::shared_ptr<const ProcessMap> processes =
        std::make_shared<ProcessMap>();
    std::mutex mutex;
    std::jthread worker;

    // maps pid to process
  public:
    std::shared_ptr<const ProcessMap> getProcesses();
    void updateProcesses();
};
