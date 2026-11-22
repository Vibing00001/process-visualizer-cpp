#include "CameraController.h"

#include <algorithm>
#include <cmath>

CameraController::CameraController() {
    camera.up = {0.0f, 1.0f, 0.0f};
    camera.fovy = 45.0f;
    camera.projection = CAMERA_PERSPECTIVE;

    updatePosition(18.0f);
}

void CameraController::setSceneRadius(float radius) { sceneRadius = radius; }

void CameraController::update(const std::optional<Vector3> &selectedPosition) {

    // Rotate camera with right mouse button
    if (IsMouseButtonDown(MOUSE_BUTTON_RIGHT)) {
        Vector2 delta = GetMouseDelta();

        yaw -= delta.x * 0.005f;
        pitch += delta.y * 0.005f;

        pitch = std::clamp(pitch, -1.4f, 1.4f);
    }

    float aspect = static_cast<float>(std::max(GetScreenWidth(), 1)) /
                   std::max(GetScreenHeight(), 1);
    float verticalHalfAngle = camera.fovy * DEG2RAD / 2.0f;
    float horizontalHalfAngle = std::atan(std::tan(verticalHalfAngle) * aspect);
    float halfAngle = std::min(verticalHalfAngle, horizontalHalfAngle);
    float fitDistance = std::max(18.0f, sceneRadius / std::sin(halfAngle));

    float wheel = GetMouseWheelMove();
    float zoomFactor = std::pow(0.9f, wheel);
    if (IsKeyPressed(KEY_R)) {
        yaw = 0.785f;
        pitch = 0.5f;
        zoom = 1.0f;
        focusedDistance.reset();
    } else if (selectedPosition && (focusedDistance || wheel > 0.0f)) {
        // Store the close-up distance in world units so scene updates cannot
        // change how close the camera is to the selected process.
        float distance = focusedDistance.value_or(std::max(3.0f, fitDistance * zoom));
        focusedDistance = std::clamp(distance * zoomFactor, 3.0f,
                                     std::max(distance, fitDistance * 2.0f));
    } else {
        focusedDistance.reset();
        zoom = std::clamp(zoom * zoomFactor, 0.03f, 2.0f);
    }

    camera.target = focusedDistance ? *selectedPosition : Vector3{};
    updatePosition(focusedDistance.value_or(std::max(3.0f, fitDistance * zoom)));
}

void CameraController::updatePosition(float distance) {
    camera.position = {
        camera.target.x + distance * std::cos(pitch) * std::sin(yaw),
        camera.target.y + distance * std::sin(pitch),
        camera.target.z + distance * std::cos(pitch) * std::cos(yaw)};
}

const Camera3D &CameraController::getCamera() const { return camera; }
