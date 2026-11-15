#include "ProcessRenderer.h"
#include "raylib.h"
#include "raymath.h"
#include <algorithm>
#include <iostream>
#include <limits>
#include <optional>
#include <unordered_map>

// Constructor
ProcessRenderer::ProcessRenderer(const Shader &shader) {
    Mesh mesh = GenMeshSphere(1.0f, 64, 64);

    sphere = LoadModelFromMesh(mesh);

    sphere.materials[0].shader = shader;
}

float ProcessRenderer::calculateRadius(const Process &process) const {
    return std::clamp(0.5f + process.memoryMB / 2000.0f, 0.5f, 1.5f);
}

// Destructor
ProcessRenderer::~ProcessRenderer() { UnloadModel(sphere); }

std::optional<int> ProcessRenderer::pickProcess(
    const Ray &ray, const std::unordered_map<int, Process> &processes) const {
    float minDist = std::numeric_limits<float>::infinity();
    std::optional<int> hitPid;
    for (const auto &[pid, process] : processes) {
        float radius = calculateRadius(process);

        RayCollision collision =
            GetRayCollisionSphere(ray, process.pos, radius);

        if (collision.hit && collision.distance < minDist) {
            minDist = collision.distance;
            hitPid = pid;
        }
    }

    if (hitPid.has_value()) {
        std::cout << "PID: " << hitPid.value() << " was clicked." << "\n";
    }

    return hitPid;
}

void ProcessRenderer::renderLabels(
    const std::unordered_map<int, Process> &processes,
    const Camera3D &camera) const {
    for (const auto &[pid, process] : processes) {
        float radius = calculateRadius(process);
        Vector3 labelPos =
            Vector3Add(process.pos, Vector3{0.0f, radius + 0.3f, 0.0f});
        Vector2 screenPos = GetWorldToScreen(labelPos, camera);

        std::string name = process.name;
        std::string label = name + " (" + std::to_string(pid) + ")";
        int fontSize = 20;

        int textWidth = MeasureText(label.c_str(), fontSize);

        int textX = static_cast<int>(screenPos.x) - textWidth / 2;
        int textY = static_cast<int>(screenPos.y) - fontSize;

        // Draw the label
        DrawText(label.c_str(), textX, textY, fontSize, WHITE);
    }
}

void ProcessRenderer::render(
    const std::unordered_map<int, Process> &processes) const {

    // Draw parent-child connections
    for (const auto &[pid, process] : processes) {
        int ppid = process.ppid;

        auto it = processes.find(ppid);

        if (it == processes.end())
            continue;

        const Process &parent = it->second;

        DrawLine3D(parent.pos, process.pos, BLUE);
    }

    // Draw process spheres
    for (const auto &[pid, process] : processes) {

        Color color = GREEN;

        if (process.cpuUsage >= 75.0f) {
            color = RED;
        } else if (process.cpuUsage >= 50.0f) {
            color = ORANGE;
        } else if (process.cpuUsage >= 25.0f) {
            color = YELLOW;
        }

        float radius =
            std::clamp(0.5f + process.memoryMB / 2000.0f, 0.5f, 1.5f);

        DrawModelEx(sphere, process.pos, Vector3{0.0f, 1.0f, 0.0f}, 0.0f,
                    Vector3{radius, radius, radius}, color);
    }
}
