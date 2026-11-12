#include "Application.h"
#include "raylib.h"

Application::Application() {
    SetConfigFlags(FLAG_MSAA_4X_HINT);
    InitWindow(1920, 1080, "Linux Process Visualizer");
    SetTargetFPS(60);
}

Application::~Application() { CloseWindow(); }

void Application::run() {

    // Load GPU shader
    Shader shader = LoadShader("shaders/lighting.vs", "shaders/lighting.fs");

    // Create reusable sphere model
    Mesh mesh = GenMeshSphere(1.0f, 64, 64);
    Model sphere = LoadModelFromMesh(mesh);

    // Attach shader to the model
    sphere.materials[0].shader = shader;

    // Find shader uniform locations
    int lightLoc = GetShaderLocation(shader, "lightDirection");
    int viewLoc = GetShaderLocation(shader, "viewPos");

    // Configure our light direction
    float lightDirection[3] = {1.0f, 1.0f, 1.0f};

    SetShaderValue(shader, lightLoc, lightDirection, SHADER_UNIFORM_VEC3);

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
        Camera3D camera = cameraController.getCamera();

        SetShaderValue(shader, viewLoc, &camera.position, SHADER_UNIFORM_VEC3);

        BeginDrawing();

        ClearBackground(BLACK);

        BeginMode3D(cameraController.getCamera());

        renderer.render(processManager.getProcesses(), sphere);

        EndMode3D();

        DrawFPS(10, 10);
        EndDrawing();
    }

    UnloadModel(sphere);
    UnloadShader(shader);
}
