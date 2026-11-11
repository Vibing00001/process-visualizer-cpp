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

    Process process1 = {100, 0, "systemd", Vector3{0.0f, 6.0f, 0.0f}};
    Process process2 = {200, 100, "firefox", Vector3{-4.0f, 2.0f, 0.0f}};
    Process process3 = {300, 100, "vim", Vector3{4.0f, 2.0f, 0.0f}};

    processManager.addProcess(process1);
    processManager.addProcess(process2);
    processManager.addProcess(process3);

    while (!WindowShouldClose()) {
        UpdateCamera(&camera, CAMERA_FREE);
        BeginDrawing();

        ClearBackground(BLACK);

        BeginMode3D(camera);

        renderer.render(processManager.getProcesses());

        EndMode3D();

        DrawFPS(10, 10);
        EndDrawing();
    }
}
