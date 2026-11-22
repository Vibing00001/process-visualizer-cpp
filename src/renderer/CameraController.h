#pragma once

#include "raylib.h"
#include <optional>

class CameraController {
  private:
    Camera3D camera{};
    float yaw = 0.785f;
    float pitch = 0.5f;
    float sceneRadius = 0.0f;
    float zoom = 1.0f;
    std::optional<float> focusedDistance;

    void updatePosition(float distance);

  public:
    CameraController();
    void setSceneRadius(float radius);
    void startCloseUp();
    void update(const std::optional<Vector3> &selectedPosition);
    const Camera3D& getCamera() const;
};
