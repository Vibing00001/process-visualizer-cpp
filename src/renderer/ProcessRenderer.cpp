#include "ProcessRenderer.h"
#include "raylib.h"

void ProcessRenderer::render(const std::vector<Process> &processes) const {
    for (const auto &process : processes) {
        DrawSphere(process.pos, 1.0, WHITE);
    }

    DrawGrid(20, 1.0f);
}
