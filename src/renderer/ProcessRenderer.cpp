#include "ProcessRenderer.h"
#include "raylib.h"
#include "raymath.h"
#include "rlgl.h"
#include <algorithm>
#include <array>
#include <cmath>
#include <format>
#include <limits>
#include <optional>
#include <unordered_map>
#include <vector>

namespace {

constexpr Color Primary{242, 237, 249, 255};
constexpr Color Secondary{174, 167, 195, 255};
constexpr Color Accent{226, 181, 255, 255};
constexpr Color Panel{24, 22, 37, 250};
constexpr Color Divider{55, 48, 73, 255};
constexpr float Margin = 26.0f;
constexpr float Tracking = 0.5f;

struct CpuRange {
    float minimum;
    Color color;
    const char *label;
};

constexpr std::array<CpuRange, 4> CpuRanges{{
    {0.0f, {119, 140, 225, 255}, "<5"},
    {5.0f, {56, 233, 171, 255}, "5+"},
    {10.0f, {255, 188, 75, 255}, "10+"},
    {15.0f, {255, 93, 131, 255}, "15+"},
}};

Color cpuColor(float usage) {
    for (auto range = CpuRanges.rbegin(); range != CpuRanges.rend(); ++range) {
        if (usage >= range->minimum) {
            return range->color;
        }
    }
    return CpuRanges.front().color;
}

Font loadUiFont(const char *path) {
    std::array<int, 191> glyphs{};
    for (int i = 0; i < 95; ++i) {
        glyphs[i] = i + 32;
    }
    for (int i = 95; i < static_cast<int>(glyphs.size()); ++i) {
        glyphs[i] = i + 65;
    }
    Font font = LoadFontEx(path, 48, glyphs.data(), glyphs.size());
    if (font.texture.id == 0) {
        return GetFontDefault();
    }
    if (font.texture.id != GetFontDefault().texture.id) {
        SetTextureFilter(font.texture, TEXTURE_FILTER_BILINEAR);
    }
    return font;
}

Rectangle inspectorBounds() {
    constexpr float width = 294.0f;
    return {GetScreenWidth() - Margin - width, Margin, width, 204.0f};
}

Rectangle footerBounds() {
    return {0.0f, GetScreenHeight() - 52.0f,
            static_cast<float>(GetScreenWidth()), 52.0f};
}

} // namespace

ProcessRenderer::ProcessRenderer(const Shader &shader) {
    Mesh mesh = GenMeshSphere(1.0f, 40, 40);

    sphere = LoadModelFromMesh(mesh);

    sphere.materials[0].shader = shader;
    selectionEmissionLocation = GetShaderLocation(shader, "selectionEmission");

    sans = loadUiFont("assets/fonts/UbuntuSans.ttf");
    mono = loadUiFont("assets/fonts/UbuntuSansMono.ttf");

    Image background = GenImageGradientRadial(
        256, 256, 0.08f, Color{31, 25, 48, 255}, Color{10, 10, 19, 255});
    backdrop = LoadTextureFromImage(background);
    UnloadImage(background);
    SetTextureFilter(backdrop, TEXTURE_FILTER_BILINEAR);

    // A bright glow hugs the sphere's rim and fades into a wider halo.
    constexpr int size = 256;
    Image halo = GenImageColor(size, size, BLANK);
    auto *pixels = static_cast<Color *>(halo.data);
    for (int y = 0; y < size; ++y) {
        for (int x = 0; x < size; ++x) {
            float dx = (x + 0.5f - size / 2.0f) / (size / 2.0f);
            float dy = (y + 0.5f - size / 2.0f) / (size / 2.0f);
            float distance = std::sqrt(dx * dx + dy * dy);
            float edge = std::clamp((1.0f - distance) / 0.24f, 0.0f, 1.0f);
            edge = edge * edge * (3.0f - 2.0f * edge);
            float fromRim = distance - 0.50f;
            float bloom = 0.40f * std::exp(-27.0f * fromRim * fromRim) +
                          0.25f * std::exp(-2.8f * distance * distance);
            pixels[y * size + x] = Accent;
            pixels[y * size + x].a =
                static_cast<unsigned char>(255.0f * bloom * edge);
        }
    }
    haloTexture = LoadTextureFromImage(halo);
    UnloadImage(halo);
    SetTextureFilter(haloTexture, TEXTURE_FILTER_BILINEAR);
}

float ProcessRenderer::calculateRadius(const Process &process) const {
    return std::clamp(0.5f + process.memoryMB / 2000.0f, 0.5f, 1.5f);
}

ProcessRenderer::~ProcessRenderer() {
    UnloadFont(mono);
    UnloadFont(sans);
    UnloadTexture(backdrop);
    UnloadTexture(haloTexture);
    UnloadModel(sphere);
}

void ProcessRenderer::renderBackdrop() const {
    DrawTexturePro(backdrop,
                   {0.0f, 0.0f, static_cast<float>(backdrop.width),
                    static_cast<float>(backdrop.height)},
                   {0.0f, 0.0f, static_cast<float>(GetScreenWidth()),
                    static_cast<float>(GetScreenHeight())},
                   {}, 0.0f, WHITE);
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

    // Flush before changing depth state; translucent halos must not write
    // depth.
    rlDrawRenderBatchActive();
    rlDisableDepthMask();
    BeginBlendMode(BLEND_ADDITIVE);
    DrawBillboard(camera, haloTexture, process.pos, radius * 4.0f, WHITE);
    EndBlendMode();
    rlDrawRenderBatchActive();
    rlEnableDepthMask();
}

bool ProcessRenderer::isOverHud(Vector2 point, bool showInspector) const {
    return CheckCollisionPointRec(point, footerBounds()) ||
           (showInspector && CheckCollisionPointRec(point, inspectorBounds()));
}

void ProcessRenderer::renderHud(
    const std::optional<int> &selectedPid,
    const std::unordered_map<int, Process> &processes) const {
    const Vector2 mark{Margin + 13.0f, Margin + 14.0f};
    DrawRing(mark, 10.5f, 12.0f, 22.0f, 158.0f, 20, Accent);
    DrawRing(mark, 10.5f, 12.0f, 202.0f, 338.0f, 20, Accent);
    DrawCircleV(mark, 4.0f, Accent);
    DrawTextEx(sans, "Process Visualizer", {Margin + 37.0f, Margin},
               27.0f, Tracking, Primary);
    auto count = processes.empty() ? std::string("Scanning processes")
                                   : std::format("{} processes", processes.size());
    DrawTextEx(mono, count.c_str(), {Margin + 38.0f, Margin + 34.0f}, 15.0f,
               Tracking, Secondary);

    Rectangle footer = footerBounds();
    DrawRectangleRec(footer, Panel);
    DrawLineV({0.0f, footer.y}, {footer.width, footer.y}, Divider);
    const float footerY = footer.y + 17.0f;
    constexpr std::array controls{
        std::array{"Click", "Select"}, std::array{"Right drag", "Orbit"},
        std::array{"Scroll", "Zoom"}, std::array{"R", "Overview"}};
    float controlX = Margin;
    for (const auto &[key, action] : controls) {
        DrawTextEx(sans, key, {controlX, footerY}, 16.0f, Tracking, Primary);
        controlX += MeasureTextEx(sans, key, 16.0f, Tracking).x + 6.0f;
        DrawTextEx(sans, action, {controlX, footerY}, 16.0f, Tracking, Secondary);
        controlX += MeasureTextEx(sans, action, 16.0f, Tracking).x + 19.0f;
    }
    float legendX = footer.width - Margin - 222.0f;
    DrawTextEx(sans, "CPU %", {legendX, footerY}, 15.0f, Tracking, Secondary);
    legendX += 53.0f;
    for (const CpuRange &range : CpuRanges) {
        DrawCircleV({legendX + 4.0f, footerY + 8.0f}, 3.0f, range.color);
        DrawTextEx(mono, range.label, {legendX + 12.0f, footerY}, 14.0f,
                   Tracking, Primary);
        legendX += 43.0f;
    }

    if (!selectedPid) {
        return;
    }
    auto it = processes.find(*selectedPid);
    if (it == processes.end()) {
        return;
    }
    const Process &process = it->second;
    Rectangle panel = inspectorBounds();
    DrawRectangleRounded(panel, 0.13f, 10, Panel);
    DrawRectangleRoundedLinesEx(panel, 0.13f, 10, 1.0f, Divider);

    const float x = panel.x + 20.0f;
    const float y = panel.y + 19.0f;
    const float contentWidth = panel.width - 40.0f;
    const char *name = process.name.empty() ? "Unnamed process" : process.name.c_str();
    constexpr float titleSize = 30.0f;
    float titleWidth = MeasureTextEx(sans, name, titleSize, Tracking).x;
    float fittedTitle = titleSize * std::min(1.0f, contentWidth / titleWidth);
    DrawTextEx(sans, name, {x, y}, fittedTitle, Tracking, Primary);
    auto identity = std::format("PID {}   /   Parent {}", process.pid, process.ppid);
    DrawTextEx(mono, identity.c_str(), {x, y + 41.0f}, 15.0f, Tracking, Secondary);
    DrawLineV({x, y + 72.0f}, {x + contentWidth, y + 72.0f}, Divider);

    const float memoryX = x + 132.0f;
    const Color usageColor = cpuColor(process.cpuUsage);
    auto cpu = std::format("{:.1f}%", process.cpuUsage);
    auto memory = std::format("{:.1f} MB", process.memoryMB);
    DrawTextEx(sans, "CPU usage", {x, y + 88.0f}, 15.0f, Tracking, Secondary);
    DrawTextEx(sans, "Memory", {memoryX, y + 88.0f}, 15.0f, Tracking, Secondary);
    DrawTextEx(mono, cpu.c_str(), {x, y + 111.0f}, 24.0f, Tracking, usageColor);
    DrawTextEx(mono, memory.c_str(), {memoryX, y + 111.0f}, 22.0f, Tracking, Primary);
    DrawRectangleRec({x, y + 153.0f, contentWidth, 3.0f}, Divider);
    const float filled = std::clamp(process.cpuUsage, 0.0f, 100.0f) / 100.0f;
    DrawRectangleRec({x, y + 153.0f, contentWidth * filled, 3.0f}, usageColor);
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

    return hitPid;
}

// draws labels
void ProcessRenderer::renderLabels(
    const std::unordered_map<int, Process> &processes,
    const Camera3D &camera, const std::optional<int> &selectedPid) const {
    struct Label {
        const Process *process;
        Vector2 anchor;
        float depth;
        float screenRadius;
    };

    const Vector3 forward =
        Vector3Normalize(Vector3Subtract(camera.target, camera.position));
    const Vector3 right =
        Vector3Normalize(Vector3CrossProduct(forward, camera.up));
    const Vector3 up = Vector3CrossProduct(right, forward);
    constexpr float padding = 6.0f;
    const int screenWidth = GetScreenWidth();
    const int screenHeight = GetScreenHeight();
    const float pixelsPerUnit =
        screenHeight * 0.5f / std::tan(camera.fovy * DEG2RAD * 0.5f);

    std::vector<Label> labels;
    labels.reserve(processes.size());
    for (const auto &[pid, process] : processes) {
        float depth = Vector3DotProduct(
            Vector3Subtract(process.pos, camera.position), forward);
        if (depth <= rlGetCullDistanceNear() ||
            depth >= rlGetCullDistanceFar()) {
            continue;
        }

        float radius = calculateRadius(process);
        float screenRadius = radius * pixelsPerUnit / depth;
        if (screenRadius < 6.0f && selectedPid != pid) {
            continue;
        }
        Vector3 labelPos = Vector3Add(process.pos, Vector3Scale(up, radius));
        labels.push_back(
            {&process, GetWorldToScreen(labelPos, camera), depth, screenRadius});
    }

    // Claim screen space for the selected process first, then for nearby nodes.
    std::sort(labels.begin(), labels.end(), [&](const Label &a, const Label &b) {
        bool aSelected = selectedPid == a.process->pid;
        bool bSelected = selectedPid == b.process->pid;
        if (aSelected != bSelected) {
            return aSelected;
        }
        if (a.depth == b.depth) {
            return a.process->pid < b.process->pid;
        }
        return a.depth < b.depth;
    });

    std::vector<Rectangle> occupied{
        {Margin, Margin, 275.0f, 55.0f}, footerBounds()};
    if (selectedPid) {
        occupied.push_back(inspectorBounds());
    }
    for (const Label &label : labels) {
        const Process &process = *label.process;
        bool selected = selectedPid == process.pid;
        if (selected) {
            const float radius = label.screenRadius;
            occupied.push_back({label.anchor.x - radius, label.anchor.y,
                                2 * radius, 2 * radius});
        }
        const float fontSize = selected ? 20.0f : 16.0f;
        const char *name = process.name.empty() ? "Unnamed" : process.name.c_str();
        const std::string pid = std::to_string(process.pid);
        float nameWidth = MeasureTextEx(sans, name, fontSize, Tracking).x;
        float textWidth =
            nameWidth + 8.0f + MeasureTextEx(mono, pid.c_str(), fontSize, Tracking).x;
        float x = label.anchor.x - textWidth / 2.0f;
        float y = label.anchor.y - fontSize - (selected ? 15.0f : 8.0f);
        Rectangle bounds{x - padding, y - padding, textWidth + 2 * padding,
                         fontSize + 2 * padding};
        if (bounds.x < 0 || bounds.y < 0 ||
            bounds.x + bounds.width > screenWidth ||
            bounds.y + bounds.height > screenHeight) {
            continue;
        }
        if (std::any_of(occupied.begin(), occupied.end(), [&](Rectangle other) {
                return CheckCollisionRecs(bounds, other);
            })) {
            continue;
        }

        if (selected) {
            DrawRectangleRounded(bounds, 0.42f, 10, Panel);
            DrawRectangleRoundedLinesEx(bounds, 0.42f, 10, 1.0f, Divider);
        } else {
            DrawTextEx(sans, name, {x + 1.0f, y + 1.0f}, fontSize, Tracking,
                       {10, 10, 19, 220});
        }
        DrawTextEx(sans, name, {x, y}, fontSize, Tracking, Primary);
        DrawTextEx(mono, pid.c_str(), {x + nameWidth + 8.0f, y}, fontSize,
                   Tracking, selected ? Accent : Secondary);
        occupied.push_back(bounds);
    }
}

void ProcessRenderer::render(
    const std::unordered_map<int, Process> &processes,
    const std::optional<int> &selectedPid) const {
    // Blend the links first so the solid spheres cover their endpoints.
    rlDrawRenderBatchActive();
    rlDisableDepthMask();
    for (const auto &[pid, process] : processes) {
        auto parent = processes.find(process.ppid);
        if (parent == processes.end()) {
            continue;
        }
        const Color connection = selectedPid == pid ? Color{226, 181, 255, 120}
                                                    : Color{143, 133, 183, 31};
        DrawLine3D(parent->second.pos, process.pos, connection);
    }
    rlDrawRenderBatchActive();
    rlEnableDepthMask();

    auto drawSphere = [&](const Process &process) {
        float radius = calculateRadius(process);
        DrawModelEx(sphere, process.pos, Vector3{0.0f, 1.0f, 0.0f}, 0.0f,
                    Vector3{radius, radius, radius}, cpuColor(process.cpuUsage));
    };
    const Process *selected = nullptr;
    for (const auto &[pid, process] : processes) {
        if (selectedPid == pid) {
            selected = &process;
        } else {
            drawSphere(process);
        }
    }
    if (selected) {
        const Shader shader = sphere.materials[0].shader;
        const Vector3 emission{
            Accent.r / 255.0f, Accent.g / 255.0f, Accent.b / 255.0f};
        const Vector3 noEmission{};
        SetShaderValue(shader, selectionEmissionLocation, &emission,
                       SHADER_UNIFORM_VEC3);
        drawSphere(*selected);
        SetShaderValue(shader, selectionEmissionLocation, &noEmission,
                       SHADER_UNIFORM_VEC3);
    }
}
