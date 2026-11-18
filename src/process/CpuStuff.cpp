#include "CpuStuff.h"

#include <fstream>
#include <sstream>
#include <string>
#include <unistd.h>

double CalculateCPU::calculateCpuUsage(const CpuSample &previous,
                                       const CpuSample &current) {
    double elapsed =
        std::chrono::duration<double>(current.timestamp - previous.timestamp)
            .count();

    if (elapsed <= 0 || current.ticks < previous.ticks ||
        current.startTime != previous.startTime) {
        return 0.0;
    }

    long ticksPerSecond = sysconf(_SC_CLK_TCK);

    if (ticksPerSecond <= 0) {
        return 0.0;
    }

    double cpuSeconds =
        static_cast<double>(current.ticks - previous.ticks) / ticksPerSecond;

    return (cpuSeconds / elapsed) * 100.0;
}

std::optional<unsigned long long> CalculateCPU::readCpuTicks(int pid) {
    auto sample = readCpuSample(pid);
    if (!sample) {
        return std::nullopt;
    }
    return sample->ticks;
}

std::optional<CpuSample> CalculateCPU::readCpuSample(int pid) {
    if (pid <= 0) {
        return std::nullopt;
    }

    std::ifstream file("/proc/" + std::to_string(pid) + "/stat");

    if (!file.is_open()) {
        return std::nullopt;
    }

    std::string line;
    if (!std::getline(file, line)) {
        return std::nullopt;
    }

    // Skip the process name, which may contain spaces.
    size_t pos = line.rfind(')');

    if (pos == std::string::npos) {
        return std::nullopt;
    }

    std::istringstream iss(line.substr(pos + 1));

    std::string field;

    // Skip fields 3 through 13.
    for (int i = 3; i <= 13; ++i) {
        if (!(iss >> field)) {
            return std::nullopt;
        }
    }

    // Fields 14 and 15
    unsigned long long utime;
    unsigned long long stime;

    if (!(iss >> utime >> stime)) {
        return std::nullopt;
    }

    // Skip fields 16 through 21; field 22 identifies this process's lifetime.
    for (int i = 16; i <= 21; ++i) {
        if (!(iss >> field)) {
            return std::nullopt;
        }
    }

    unsigned long long startTime;
    if (!(iss >> startTime)) {
        return std::nullopt;
    }

    return CpuSample{utime + stime, std::chrono::steady_clock::now(), startTime};
}

double CalculateCPU::getCpuUsage(int pid) {
    auto current = readCpuSample(pid);
    if (!current) {
        forgetProcess(pid);
        return 0.0;
    }

    auto previous = previousSamples.find(pid);
    if (previous == previousSamples.end()) {
        previousSamples.emplace(pid, *current);
        return 0.0;
    }

    double usage = calculateCpuUsage(previous->second, *current);
    previous->second = *current;
    return usage;
}

void CalculateCPU::forgetProcess(int pid) {
    previousSamples.erase(pid);
}
