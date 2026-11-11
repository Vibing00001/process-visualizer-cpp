#pragma once

#include "../process/Process.h"
#include <unordered_map>

class ProcessRenderer {
  public:
    void render(const std::unordered_map<int, Process> &processes) const;
};
