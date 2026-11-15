#pragma once

#include "../process/ProcessManager.h"
#include "../renderer/CameraController.h"
#include "../renderer/Lighting.h"
#include "../renderer/ProcessRenderer.h"
#include <memory>
#include <optional>

class Application {
  private:
    ProcessManager processManager;
    CameraController cameraController;

    std::unique_ptr<Lighting> lighting;
    std::unique_ptr<ProcessRenderer> renderer;
    std::optional<int> selectedPid;

  public:
    Application();
    ~Application();

    Application(const Application &) = delete;
    Application &operator=(const Application &) = delete;

    void run();
};
