#pragma once
#include "raylib.h"

// Owns the GPU shader. Must be destroyed before CloseWindow().
class Lighting {
  public:
    Lighting();
    ~Lighting();

    Lighting(const Lighting &) = delete;
    Lighting &operator=(const Lighting &) = delete;
    Lighting(Lighting &&) = delete;
    Lighting &operator=(Lighting &&) = delete;

    void update(const Camera3D &camera) const;
    const Shader &getShader() const { return shader; }

  private:
    Shader shader{};
    int viewLocation = -1;
};
