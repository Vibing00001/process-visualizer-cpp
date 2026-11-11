#pragma once

#include "../process/ProcessManager.h"
#include "../renderer/ProcessRenderer.h"

class Application {
  private:
    ProcessRenderer renderer;
    ProcessManager processManager;

  public:
    Application();
    ~Application();

    Application(const Application &) = delete;
    Application &operator=(const Application &) = delete;

    void run();
};
