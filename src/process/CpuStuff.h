#pragma once

#include "Process.h"
#include <chrono>
#include <optional>
#include <unordered_map>

using ProcessMap = std::unordered_map<int, Process>;

struct CpuSample {
    unsigned long long ticks;
    std::chrono::steady_clock::time_point timestamp;
    unsigned long long startTime = 0;
};

class CalculateCPU {
  private:
    std::unordered_map<int, CpuSample> previousSamples;
    std::optional<CpuSample> readCpuSample(int pid);

  public:
    double calculateCpuUsage(const CpuSample &previous,
                             const CpuSample &current);
    std::optional<unsigned long long> readCpuTicks(int pid);
    // Reuse this instance across refreshes. The first sample returns zero;
    // later samples report percent of one core (which can exceed 100%).
    double getCpuUsage(int pid);
    // Call when removing a process from the displayed process list.
    void forgetProcess(int pid);
    void cleanup(const ProcessMap &processes);
};
