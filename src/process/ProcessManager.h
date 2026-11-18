#pragma once

#include "Process.h"
#include <filesystem>
#include <unordered_map>
#include <utility>
#include <vector>

namespace fs = std::filesystem;

class ProcessManager {
  private:
    std::unordered_map<int, Process> processes;
    bool checkNumeric(const std::string &procName) const;

    // maps pid to process
  public:
    void addProcess(const Process &process);
    const std::unordered_map<int, Process> &getProcesses() const;
    void getPath(const fs::path &filePath) const;
};
