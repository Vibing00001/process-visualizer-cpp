#pragma once

#include "../process/Process.h"
#include <unordered_map>

class ProcessRenderer {
  private:
    Model sphere{};

  public:
    explicit ProcessRenderer(const Shader &shader);
    ~ProcessRenderer();

    void render(const std::unordered_map<int, Process> &processes) const;
};
