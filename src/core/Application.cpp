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

    processes.push_back({1, 0, "systemd", Vector3{0.0f, 0.0f, 0.0f}});
    processes.push_back({200, 1, "firefox", Vector3{1.0f, 0.0f, 3.0f}});
    processes.push_back({300, 1, "vim", Vector3{4.0f, 2.0f, 3.0f}});

    while (!WindowShouldClose()) {
        UpdateCamera(&camera, CAMERA_FREE);
        BeginDrawing();

        ClearBackground(BLACK);

        BeginMode3D(camera);

        renderer.render(processes);

        EndMode3D();

        DrawFPS(10, 10);
        EndDrawing();
    }
}
