#pragma once

#include "CpuStuff.h"
#include "Process.h"
#include <condition_variable>
#include <filesystem>
#include <thread>
#include <unordered_map>
#include <utility>
#include <vector>

using ProcessMap = std::unordered_map<int, Process>;

class ProcessManager {
  public:
    std::shared_ptr<const ProcessMap> getProcesses();
    void updateProcesses();
    ProcessManager();
    bool checkNumeric(const std::string &procName) const;

  private:
    CalculateCPU cpuCalculator;
    std::shared_ptr<const ProcessMap> processes =
        std::make_shared<ProcessMap>();
    std::mutex mutex;
    std::condition_variable_any cv;
    std::mutex sleepMutex;
    void workerLoop(std::stop_token stopToken);
    std::jthread worker;

    // maps pid to process
};
