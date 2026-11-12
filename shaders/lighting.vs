#version 330

in vec3 vertexPosition;
in vec3 vertexNormal;

uniform mat4 mvp;
uniform mat4 matModel;

out vec3 fragPosition;
out vec3 fragNormal;

void main()
{
    // Position in world coordinates
    fragPosition = vec3(matModel * vec4(vertexPosition, 1.0));

    // Surface normal in world coordinates
    fragNormal = normalize(mat3(matModel) * vertexNormal);

    // Position on screen
    gl_Position = mvp * vec4(vertexPosition, 1.0);
}
