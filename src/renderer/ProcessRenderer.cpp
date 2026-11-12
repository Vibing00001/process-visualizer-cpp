#include "ProcessRenderer.h"
#include "raylib.h"

#include <algorithm>
#include <unordered_map>

void ProcessRenderer::render(const std::unordered_map<int, Process> &processes,
                             const Model &sphere) const {

    for (const auto &[pid, process] : processes) {
        int ppid = process.ppid;

        auto it = processes.find(ppid);

        if (it == processes.end())
            continue;

        const Process &parent = it->second;
        Vector3 parentVector = parent.pos;

        DrawLine3D(parentVector, process.pos, BLUE);
    }

    for (const auto &[pid, process] : processes) {

        // Color based on CPU utilization
        Color color = GREEN;

        if (process.cpuUsage >= 75.0f) {
            color = RED;
        } else if (process.cpuUsage >= 50.0f) {
            color = ORANGE;
        } else if (process.cpuUsage >= 25.0f) {
            color = YELLOW;
        }

        // Radius based on memory usage
        float radius =
            std::clamp(0.5f + process.memoryMB / 2000.0f, 0.5f, 1.5f);

        // Solid sphere
        // DrawSphere(process.pos, radius, color);

        DrawModelEx(sphere, process.pos, Vector3{0.0f, 1.0f, 0.0f}, 0.0f,
                    Vector3{radius, radius, radius}, color);

        // Slightly larger wireframe
        // DrawSphereWires(process.pos, radius * 1.02f, 16, 16, Fade(color,
        // 0.15f));
    }

    // DrawGrid(50, 2.0f);
}
