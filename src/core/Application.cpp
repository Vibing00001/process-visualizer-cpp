#include "Application.h"
#include "raylib.h"

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

        BeginDrawing();
        ClearBackground(BLACK);

        BeginMode3D(camera);

        renderer->render(processManager.getProcesses());

        EndMode3D();

        // Sphere position
        Vector3 spherePos{0.0f, 6.0f, 0.0f};

        // Move the label above the sphere
        float radius = 0.55f;
        float padding = 0.3f;

        Vector3 labelPos{spherePos.x, spherePos.y + radius + padding,
                         spherePos.z};

        // Convert 3D world coordinates into screen coordinates
        Vector2 screenPos = GetWorldToScreen(labelPos, camera);

        // Measure the text width
        std::string name = "systemd";
        int pid = 1;

        std::string label = name + " (" + std::to_string(pid) + ")";
        int fontSize = 20;

        int textWidth = MeasureText(label.c_str(), fontSize);

        // Center the text horizontally and place it above the anchor
        int textX = static_cast<int>(screenPos.x) - textWidth / 2;
        int textY = static_cast<int>(screenPos.y) - fontSize;

        // Draw the label
        DrawText(label.c_str(), textX, textY, fontSize, WHITE);
        DrawFPS(10, 10);
        EndDrawing();
    }
}
