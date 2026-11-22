#pragma once

#include "../process/Process.h"
#include <optional>
#include <unordered_map>

class ProcessRenderer {
  private:
    Model sphere{};
    int selectionEmissionLocation = -1;
    Texture2D haloTexture{};
    Texture2D backdrop{};
    Font sans{};
    Font mono{};
    float calculateRadius(const Process &process) const;

  public:
    explicit ProcessRenderer(const Shader &shader);
    ~ProcessRenderer();

    void renderBackdrop() const;
    void render(const std::unordered_map<int, Process> &processes,
                const std::optional<int> &selectedPid) const;
    void renderLabels(const std::unordered_map<int, Process> &processes,
                      const Camera3D &camera,
                      const std::optional<int> &selectedPid) const;

    void renderHud(const std::optional<int> &selectedPid,
                   const std::unordered_map<int, Process> &processes) const;
    bool isOverHud(Vector2 point, bool showInspector) const;

    void renderOutline(const std::optional<int> &selectedPid,
                       const std::unordered_map<int, Process> &processes,
                       const Camera3D &camera) const;

    std::optional<int>
    pickProcess(const Ray &ray,
                const std::unordered_map<int, Process> &processes) const;
};
