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

    processManager.addProcess(
        {1, 0, "systemd", Vector3{0.0f, 6.0f, 0.0f}, 10.0f, 100.0f});

    processManager.addProcess(
        {100, 1, "bash", Vector3{-4.0f, 3.0f, 0.0f}, 35.0f, 500.0f});

    processManager.addProcess(
        {200, 1, "sshd", Vector3{4.0f, 3.0f, 0.0f}, 15.0f, 200.0f});

    processManager.addProcess(
        {300, 100, "python", Vector3{-6.0f, 0.0f, 0.0f}, 80.0f, 2000.0f});

    processManager.addProcess(
        {400, 100, "vim", Vector3{-2.0f, 0.0f, 0.0f}, 55.0f, 800.0f});

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
