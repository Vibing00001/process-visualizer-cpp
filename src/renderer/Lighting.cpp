#include "Lighting.h"

Lighting::Lighting() {
    shader = LoadShader("shaders/lighting.vs", "shaders/lighting.fs");

    const int lightLocation = GetShaderLocation(shader, "lightDirection");
    viewLocation = GetShaderLocation(shader, "viewPos");

    // Direction FROM the surface TOWARD the light.
    const float direction[3] = {0.5f, 0.85f, 0.35f};
    SetShaderValue(shader, lightLocation, direction, SHADER_UNIFORM_VEC3);
}

Lighting::~Lighting() {
    if (shader.id != 0) UnloadShader(shader);
}

void Lighting::update(const Camera3D& camera) const {
    const float position[3] = {
        camera.position.x, camera.position.y, camera.position.z
    };
    SetShaderValue(shader, viewLocation, position, SHADER_UNIFORM_VEC3);
}