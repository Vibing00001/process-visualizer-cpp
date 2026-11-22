#include "Application.h"
#include "raylib.h"
#include <algorithm>
#include <cmath>
#include <memory>
#include <utility>

namespace {

const Process &startupProcess(const ProcessMap &processes) {
    auto first = std::min_element(
        processes.begin(), processes.end(), [](const auto &a, const auto &b) {
            return std::pair{a.second.name != "systemd", a.first} <
                   std::pair{b.second.name != "systemd", b.first};
        });
    return first->second;
}

} // namespace

Application::Application() {
    SetConfigFlags(FLAG_MSAA_4X_HINT | FLAG_WINDOW_RESIZABLE);
    InitWindow(1440, 900, "Linux Process Visualizer");
    SetWindowMinSize(760, 480);
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
    bool started = false;
    while (!WindowShouldClose()) {
        auto latestSnapshot = processManager.getProcesses();
        if (latestSnapshot != snapshot) {
            snapshot = latestSnapshot;
            float sceneRadius = 0.0f;
            for (const auto &[pid, process] : *snapshot) {
                float distance =
                    std::hypot(process.pos.x, process.pos.y, process.pos.z);
                sceneRadius = std::max(sceneRadius, distance);
            }
            // Leave space for the outer nodes and the screen overlays.
            cameraController.setSceneRadius(sceneRadius * 1.13f + 3.0f);
        }
        bool openingCloseUp = !started && !snapshot->empty();
        if (openingCloseUp) {
            selectedPid = startupProcess(*snapshot).pid;
            cameraController.startCloseUp();
            started = true;
        }
        Vector2 mouse = GetMousePosition();
        if (!openingCloseUp && IsMouseButtonPressed(MOUSE_BUTTON_LEFT) &&
            !renderer->isOverHud(mouse, selectedPid.has_value())) {
            Ray ray = GetScreenToWorldRay(mouse,
                                          cameraController.getCamera());
            selectedPid = renderer->pickProcess(ray, *snapshot);
        }

        std::optional<Vector3> selectedPosition;
        if (selectedPid) {
            auto it = snapshot->find(*selectedPid);
            if (it == snapshot->end()) {
                selectedPid.reset();
            } else {
                selectedPosition = it->second.pos;
            }
        }
        cameraController.update(selectedPosition);
        const Camera3D &camera = cameraController.getCamera();
        lighting->update(camera);

        BeginDrawing();
        ClearBackground(BLACK);
        renderer->renderBackdrop();

        BeginMode3D(camera);

        renderer->render(*snapshot, selectedPid);
        renderer->renderOutline(selectedPid, *snapshot, camera);

        EndMode3D();

        renderer->renderLabels(*snapshot, camera, selectedPid);

        renderer->renderHud(selectedPid, *snapshot);
        EndDrawing();
    }
}
