#version 330

in vec3 fragPosition;
in vec3 fragNormal;

uniform vec4 colDiffuse;

uniform vec3 lightDirection;
uniform vec3 viewPos;

out vec4 finalColor;

void main()
{
    vec3 normal = normalize(fragNormal);
    vec3 light = normalize(lightDirection);

    // 1. Ambient lighting
    float ambient = 0.25;

    // 2. Diffuse lighting
    float diffuse = max(dot(normal, light), 0.0);

    // 3. Specular lighting
    vec3 viewDir = normalize(viewPos - fragPosition);
    vec3 reflectDir = reflect(-light, normal);

    float specular = 0.0;

    if (diffuse > 0.0)
    {
        specular = pow(
            max(dot(viewDir, reflectDir), 0.0),
            32.0
        );
    }

    // Process color
    vec3 baseColor = colDiffuse.rgb;

    // Combine lighting
    vec3 result =
        baseColor * (ambient + diffuse * 0.65)
        + vec3(1.0) * specular * 0.35;

    finalColor = vec4(clamp(result, 0.0, 1.0), colDiffuse.a);
}
