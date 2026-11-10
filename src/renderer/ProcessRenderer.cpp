#include "ProcessRenderer.h"
#include "raylib.h"

void ProcessRenderer::render() const {
    DrawSphere({0.0f, 0.0f, 0.0f}, 1.0f, RED);
    DrawGrid(20, 1.0f);
}
