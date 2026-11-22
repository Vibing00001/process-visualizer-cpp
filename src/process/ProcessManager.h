#pragma once

#include "CpuStuff.h"
#include "Process.h"
#include <condition_variable>
#include <filesystem>
#include <random>
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
    struct LayoutSlot {
        int pid;
        Vector3 position;
    };

    CalculateCPU cpuCalculator;
    std::shared_ptr<const ProcessMap> processes =
        std::make_shared<ProcessMap>();
    std::vector<LayoutSlot> layoutSlots;
    std::mt19937 layoutRandom;
    std::mutex mutex;
    std::condition_variable_any cv;
    std::mutex sleepMutex;
    void positionProcesses(ProcessMap &snapshot);
    Vector3 nextLayoutPosition();
    void workerLoop(std::stop_token stopToken);
    std::jthread worker;

    // maps pid to process
};
