#include "ProcessRenderer.h"
#include "raylib.h"

#include <algorithm>
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
