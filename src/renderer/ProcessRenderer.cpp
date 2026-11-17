#include "ProcessRenderer.h"
#include "raylib.h"
#include "raymath.h"
#include "rlgl.h"
#include <cmath>
#include <algorithm>
#include <format>
#include <iostream>
#include <limits>
#include <optional>
#include <unordered_map>
#include <vector>

// Constructor
ProcessRenderer::ProcessRenderer(const Shader &shader) {
    Mesh mesh = GenMeshSphere(1.0f, 64, 64);

    sphere = LoadModelFromMesh(mesh);

    sphere.materials[0].shader = shader;

    glowShader = LoadShader("shaders/lighting.vs", "shaders/glow.fs");

    // Generate once: a broad halo with a smooth, fully transparent boundary.
    constexpr int size = 256;
    Image halo = GenImageColor(size, size, BLANK);
    auto *pixels = static_cast<Color *>(halo.data);
    for (int y = 0; y < size; ++y) {
        for (int x = 0; x < size; ++x) {
            float dx = (x + 0.5f - size / 2.0f) / (size / 2.0f);
            float dy = (y + 0.5f - size / 2.0f) / (size / 2.0f);
            float distance = std::sqrt(dx * dx + dy * dy);
            float edge = std::clamp((1.0f - distance) / 0.25f, 0.0f, 1.0f);
            edge = edge * edge * (3.0f - 2.0f * edge);
            float alpha = std::exp(-5.0f * distance * distance) * edge;
            pixels[y * size + x] = {226, 0, 116,
                static_cast<unsigned char>(alpha * 180.0f)};
        }
    }
    haloTexture = LoadTextureFromImage(halo);
    UnloadImage(halo);
    SetTextureFilter(haloTexture, TEXTURE_FILTER_BILINEAR);
}

float ProcessRenderer::calculateRadius(const Process &process) const {
    return std::clamp(0.5f + process.memoryMB / 2000.0f, 0.5f, 1.5f);
}

// Destructor
ProcessRenderer::~ProcessRenderer() {
    UnloadTexture(haloTexture);
    UnloadShader(glowShader);
    UnloadModel(sphere);
}

void ProcessRenderer::renderOutline(
    const std::optional<int> &selectedPid,
    const std::unordered_map<int, Process> &processes,
    const Camera3D &camera) const {
    if (!selectedPid.has_value())
        return;

    auto it = processes.find(*selectedPid);

    if (it == processes.end())
        return;

    const Process &process = it->second;
    float radius = calculateRadius(process);

    SetShaderValue(glowShader, GetShaderLocation(glowShader, "viewPos"),
                   &camera.position, SHADER_UNIFORM_VEC3);

    // A local material copy leaves the shared sphere's lighting unchanged.
    Material material = sphere.materials[0];
    material.shader = glowShader;
    float surfaceRadius = radius * 1.002f;
    Matrix transform = MatrixMultiply(
        MatrixScale(surfaceRadius, surfaceRadius, surfaceRadius),
        MatrixTranslate(process.pos.x, process.pos.y, process.pos.z));
    DrawMesh(sphere.meshes[0], material, transform);

    // Flush before changing depth state; translucent halos must not write depth.
    rlDrawRenderBatchActive();
    rlDisableDepthMask();
    BeginBlendMode(BLEND_ADDITIVE);
    DrawBillboard(camera, haloTexture, process.pos, radius * 5.0f, WHITE);
    EndBlendMode();
    rlDrawRenderBatchActive();
    rlEnableDepthMask();
}

void ProcessRenderer::renderTextInfo(
    const std::optional<int> &selectedPid,
    const std::unordered_map<int, Process> &processes) const {
    if (selectedPid.has_value()) {
        auto it = processes.find(selectedPid.value());
        // TODO : implement the text box with process info
        if (it != processes.end()) {
            const Process &process = it->second;
            int panelWidth = 350;
            int panelHeight = 250;

            int panelX = GetScreenWidth() - panelWidth - 20;
            int panelY = 20;

            DrawRectangle(panelX, panelY, panelWidth, panelHeight, DARKGRAY);

            std::string procName = process.name;
            std::string procPID = std::to_string(process.pid);
            std::string parentPID = std::to_string(process.ppid);
            std::string usageCPU = std::format("{:.1f}%", process.cpuUsage);
            std::string memoryUsage =
                std::format("{:.1f} MB", process.memoryMB);

            std::vector<std::string> leftSide = {
                "Process Name: ", "Process PID: ", "Parent PID: ",
                "CPU USAGE: ", "Memory Usage: "};
            std::vector<std::string> rightSide = {procName, procPID, parentPID,
                                                  usageCPU, memoryUsage};

            DrawRectangle(panelX, panelY, panelWidth, panelHeight, DARKGRAY);
            DrawText("PROCESS INFORMATION", panelX + 15, panelY + 20, 20,
                     WHITE);

            int lineSpacing = 28;

            for (size_t i = 0; i < leftSide.size(); i++) {
                DrawText((leftSide[i] + rightSide[i]).c_str(), panelX + 15,
                         panelY + 70 + static_cast<int>(i) * lineSpacing, 20,
                         WHITE);
            }
        }
    }
}

// pick the process that is clicked on by the closest sphere
std::optional<int> ProcessRenderer::pickProcess(
    const Ray &ray, const std::unordered_map<int, Process> &processes) const {
    float minDist = std::numeric_limits<float>::infinity();
    std::optional<int> hitPid;
    for (const auto &[pid, process] : processes) {
        float radius = calculateRadius(process);

        RayCollision collision =
            GetRayCollisionSphere(ray, process.pos, radius);

        if (collision.hit && collision.distance < minDist) {
            minDist = collision.distance;
            hitPid = pid;
        }
    }

    if (hitPid.has_value()) {
        std::cout << "PID: " << hitPid.value() << " was clicked." << "\n";
    }

    return hitPid;
}

// draws labels
void ProcessRenderer::renderLabels(
    const std::unordered_map<int, Process> &processes,
    const Camera3D &camera) const {
    for (const auto &[pid, process] : processes) {
        float radius = calculateRadius(process);
        Vector3 labelPos =
            Vector3Add(process.pos, Vector3{0.0f, radius + 0.3f, 0.0f});
        Vector2 screenPos = GetWorldToScreen(labelPos, camera);

        std::string name = process.name;
        std::string label = name + " (" + std::to_string(pid) + ")";
        int fontSize = 20;

        int textWidth = MeasureText(label.c_str(), fontSize);

        int textX = static_cast<int>(screenPos.x) - textWidth / 2;
        int textY = static_cast<int>(screenPos.y) - fontSize;

        // Draw the label
        DrawText(label.c_str(), textX, textY, fontSize, WHITE);
    }
}

// Draws the actual spheres
void ProcessRenderer::render(
    const std::unordered_map<int, Process> &processes) const {

    // Draw parent-child connections
    for (const auto &[pid, process] : processes) {
        int ppid = process.ppid;

        auto it = processes.find(ppid);

        if (it == processes.end())
            continue;

        const Process &parent = it->second;

        DrawLine3D(parent.pos, process.pos, BLUE);
    }

    // Draw process spheres
    for (const auto &[pid, process] : processes) {

        Color color = GREEN;

        if (process.cpuUsage >= 75.0f) {
            color = RED;
        } else if (process.cpuUsage >= 50.0f) {
            color = ORANGE;
        } else if (process.cpuUsage >= 25.0f) {
            color = YELLOW;
        }

        float radius =
            std::clamp(0.5f + process.memoryMB / 2000.0f, 0.5f, 1.5f);

        DrawModelEx(sphere, process.pos, Vector3{0.0f, 1.0f, 0.0f}, 0.0f,
                    Vector3{radius, radius, radius}, color);
    }
}
