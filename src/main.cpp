#include "raylib.h"

int main() {
    InitWindow(1280, 720, "Linux Process Visualizer");

    SetTargetFPS(60);

    Camera3D camera{};

    camera.position = Vector3{10.0f, 10.0f, 10.0f};
    camera.target = Vector3{0.0f, 0.0f, 0.0f};
    camera.up = Vector3{0.0f, 1.0f, 0.0f};

    camera.fovy = 45.0f;
    camera.projection = CAMERA_PERSPECTIVE;

    while (!WindowShouldClose()) {
        BeginDrawing();

        ClearBackground(BLACK);

        BeginMode3D(camera);

        DrawSphere(Vector3{0.0f, 0.0f, 0.0f}, 1.0f, RED);

        DrawGrid(10, 10);

        EndMode3D();
        DrawFPS(10, 10);

        EndDrawing();
    }

    CloseWindow();

    return 0;
}
