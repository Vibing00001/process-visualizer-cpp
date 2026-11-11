#include "ProcessRenderer.h"
#include "raylib.h"

#include <unordered_map>

void ProcessRenderer::render(
    const std::unordered_map<int, Process> &processes) const {

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
        DrawSphere(process.pos, 1.0, WHITE);
    }

    DrawGrid(50, 2.0f);
}
