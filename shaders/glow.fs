#version 330

in vec3 fragPosition;
in vec3 fragNormal;
uniform vec3 viewPos;
out vec4 finalColor;

void main()
{
    float facing = max(dot(normalize(fragNormal),
                          normalize(viewPos - fragPosition)), 0.0);
    // Emissive magenta: a hot pink center and saturated magenta silhouette.
    vec3 magenta = vec3(226.0, 0.0, 116.0) / 255.0;
    vec3 hotPink = vec3(1.0, 0.32, 0.68);
    vec3 color = mix(magenta, hotPink, pow(facing, 0.65));
    finalColor = vec4(color, 1.0);
}
