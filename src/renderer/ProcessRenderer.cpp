#include "ProcessRenderer.h"
#include "raylib.h"

#include <unordered_map>

void ProcessRenderer::render(const std::vector<Process> &processes) const {
    std::unordered_map<int, const Process *> processMap;

    for (const auto &process : processes) {
        processMap[process.pid] = &process;
    }

    for (const auto &process : processes) {
        auto it = processMap.find(process.ppid);

        if (it == processMap.end())
            continue;

        const Process *parent = it->second;
        Vector3 parentVector = parent->pos;

        DrawLine3D(parentVector, process.pos, BLUE);
    }

    for (const auto &process : processes) {
        DrawSphere(process.pos, 1.0, WHITE);
    }

    DrawGrid(50, 2.0f);
}
