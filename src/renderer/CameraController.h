#pragma once

#include "raylib.h"

class CameraController {
  private:
    Camera3D camera{};
    float yaw = 0.785f;
    float pitch = 0.5f;
    float distance = 18.0f;

    Vector3 target{0.0f, 2.5f, 0.0f};

    void updatePosition();

  public:
    CameraController();
    void update();
    const Camera3D& getCamera() const;
};
