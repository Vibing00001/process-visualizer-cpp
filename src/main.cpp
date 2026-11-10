#include "raylib.h"

int main() {
  InitWindow(1280, 720, "Linux Process Visualizer");

  SetTargetFPS(60);

  while (!WindowShouldClose()) {
    BeginDrawing();

    ClearBackground(BLACK);

    EndDrawing();
  }

  CloseWindow();

  return 0;
}
