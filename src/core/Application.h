#pragma once

#include "../renderer/ProcessRenderer.h"

class Application {
  private:
    ProcessRenderer renderer;

  public:
    Application();
    ~Application();

    Application(const Application &) = delete;
    Application &operator=(const Application &) = delete;

    void run();
};
