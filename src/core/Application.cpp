#include "Application.h"
#include "raylib.h"
#include <algorithm>
#include <cmath>
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
    std::shared_ptr<const ProcessMap> snapshot;
    while (!WindowShouldClose()) {
        auto latestSnapshot = processManager.getProcesses();
        if (latestSnapshot != snapshot) {
            snapshot = latestSnapshot;
            float sceneRadius = 0.0f;
            for (const auto &[pid, process] : *snapshot) {
                float distance = std::hypot(process.pos.x, process.pos.z);
                sceneRadius = std::max(sceneRadius, distance);
            }
            // Leave room around the outermost centers for the spheres and labels.
            cameraController.setSceneRadius(sceneRadius + 3.0f);
        }
        bool mouseClicked = IsMouseButtonPressed(MOUSE_BUTTON_LEFT);
        if (mouseClicked) {
            Ray ray = GetScreenToWorldRay(GetMousePosition(),
                                          cameraController.getCamera());
            selectedPid = renderer->pickProcess(ray, *snapshot);
        }

        std::optional<Vector3> selectedPosition;
        if (selectedPid) {
            auto it = snapshot->find(*selectedPid);
            if (it == snapshot->end()) {
                selectedPid.reset();
            } else {
                const Process &process = it->second;
                selectedPosition = process.pos;
                if (mouseClicked) {
                    std::cout << *selectedPid << "\n";
                    std::cout << process.name << " " << process.cpuUsage << "\n";
                }
            }
        }
        cameraController.update(selectedPosition);
        const Camera3D &camera = cameraController.getCamera();
        lighting->update(camera);

        BeginDrawing();
        ClearBackground(BLACK);

        BeginMode3D(camera);

        renderer->render(*snapshot);
        renderer->renderOutline(selectedPid, *snapshot, camera);

        EndMode3D();

        renderer->renderLabels(*snapshot, camera, selectedPid);

        renderer->renderTextInfo(selectedPid, *snapshot);

        DrawFPS(10, 10);
        EndDrawing();
    }
}
