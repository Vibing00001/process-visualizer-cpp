#include "Application.h"
#include "raylib.h"
#include <iostream>
#include <memory>

Application::Application() {
    SetConfigFlags(FLAG_MSAA_4X_HINT);
    InitWindow(1920, 1080, "Linux Process Visualizer");
    SetTargetFPS(60);

    lighting = std::make_unique<Lighting>();

    renderer = std::make_unique<ProcessRenderer>(lighting->getShader());
}

Application::~Application() {
    renderer.reset();
    lighting.reset();

    CloseWindow();
}

void Application::run() {

    // Dummy processes
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
        cameraController.update();

        const Camera3D &camera = cameraController.getCamera();

        lighting->update(camera);
        Vector2 mousePos = GetMousePosition();
        bool mouseClicked = IsMouseButtonPressed(MOUSE_BUTTON_LEFT);

        // TODO: should probably refactor the code and have it in its seperate
        // function in another class
        if (mouseClicked) {
            Ray ray =
                GetScreenToWorldRay(mousePos, cameraController.getCamera());
            selectedPid =
                renderer->pickProcess(ray, processManager.getProcesses());

            if (selectedPid.has_value()) {
                std::cout << selectedPid.value() << "\n";
                const auto &processes = processManager.getProcesses();
                auto it = processes.find(selectedPid.value());

                if (it != processes.end()) {
                    const Process &process = it->second;
                    std::cout << process.name << " " << process.cpuUsage
                              << "\n";
                }
            }
        }

        BeginDrawing();
        ClearBackground(BLACK);

        BeginMode3D(camera);

        renderer->render(processManager.getProcesses());
        renderer->renderOutline(selectedPid, processManager.getProcesses());

        EndMode3D();

        renderer->renderLabels(processManager.getProcesses(), camera);

        renderer->renderTextInfo(selectedPid, processManager.getProcesses());

        DrawFPS(10, 10);
        EndDrawing();
    }
}
