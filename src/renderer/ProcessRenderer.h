#pragma once

#include "../process/Process.h"
#include <unordered_map>

class ProcessRenderer {
  private:
    Model sphere{};
    float calculateRadius(const Process &process) const;

  public:
    explicit ProcessRenderer(const Shader &shader);
    ~ProcessRenderer();

    void render(const std::unordered_map<int, Process> &processes) const;
};
