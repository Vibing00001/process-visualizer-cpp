#include "CameraController.h"

#include <algorithm>
#include <cmath>

CameraController::CameraController() {
    camera.target = target;
    camera.up = {0.0f, 1.0f, 0.0f};
    camera.fovy = 45.0f;
    camera.projection = CAMERA_PERSPECTIVE;

    updatePosition();
}

void CameraController::update() {

    // Rotate camera with right mouse button
    if (IsMouseButtonDown(MOUSE_BUTTON_RIGHT)) {
        Vector2 delta = GetMouseDelta();

        yaw -= delta.x * 0.005f;
        pitch += delta.y * 0.005f;

        pitch = std::clamp(pitch, -1.4f, 1.4f);
    }

    // Zoom using mouse wheel
    float wheel = GetMouseWheelMove();

    distance -= wheel * 1.5f;
    distance = std::clamp(distance, 3.0f, 60.0f);

    // Reset camera
    if (IsKeyPressed(KEY_R)) {
        yaw = 0.785f;
        pitch = 0.5f;
        distance = 18.0f;
    }

    updatePosition();
}

void CameraController::updatePosition() {
    camera.position = {target.x + distance * std::cos(pitch) * std::sin(yaw),
                       target.y + distance * std::sin(pitch),
                       target.z + distance * std::cos(pitch) * std::cos(yaw)};

    camera.target = target;
}

const Camera3D &CameraController::getCamera() const { return camera; }
