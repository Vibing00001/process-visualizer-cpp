#include "Application.h"
#include "raylib.h"

Application::Application() {
    InitWindow(1280, 720, "Linux Process Visualizer");
    SetTargetFPS(60);
}

Application::~Application() { CloseWindow(); }

void Application::run() {
    Camera3D camera{};

    camera.position = Vector3{10.0f, 10.0f, 10.0f};
    camera.target = Vector3{0.0f, 0.0f, 0.0f};
    camera.up = Vector3{0.0f, 1.0f, 0.0f};

    camera.fovy = 45.0f;
    camera.projection = CAMERA_PERSPECTIVE;

    while (!WindowShouldClose()) {
        UpdateCamera(&camera, CAMERA_FREE);
        BeginDrawing();

        ClearBackground(BLACK);

        BeginMode3D(camera);

        renderer.render();

        EndMode3D();

        DrawFPS(10, 10);
        EndDrawing();
    }
}
