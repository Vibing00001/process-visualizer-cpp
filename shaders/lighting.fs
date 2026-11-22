#version 330

in vec3 fragPosition;
in vec3 fragNormal;

uniform vec4 colDiffuse;

uniform vec3 lightDirection;
uniform vec3 viewPos;
uniform vec3 selectionEmission;

out vec4 finalColor;

void main()
{
    vec3 normal = normalize(fragNormal);
    vec3 light = normalize(lightDirection);

    vec3 view = normalize(viewPos - fragPosition);
    float diffuse = max(dot(normal, light), 0.0);
    float facing = max(dot(normal, view), 0.0);
    float rim = pow(1.0 - facing, 2.6);
    float reflection = max(dot(normal, normalize(light + view)), 0.0);

    vec3 base = colDiffuse.rgb;
    vec3 color = base * (0.42 + 0.54 * diffuse);
    color += mix(base, vec3(0.74, 0.80, 1.0), 0.4) * rim * 0.40;
    color += vec3(0.78, 0.87, 1.0) *
             (0.10 * pow(reflection, 8.0) + 0.26 * pow(reflection, 54.0));
    color += selectionEmission * (0.035 + 0.60 * rim);
    finalColor = vec4(min(color, vec3(1.0)), colDiffuse.a);
}
