#pragma once

#include "../process/Process.h"
#include "../renderer/ProcessRenderer.h"
#include <vector>

class Application {
  private:
    ProcessRenderer renderer;
    std::vector<Process> processes;

  public:
    Application();
    ~Application();

    Application(const Application &) = delete;
    Application &operator=(const Application &) = delete;

    void run();
};
