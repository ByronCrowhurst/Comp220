#version 330 core

out vec4 colour;

in vec4 vertexColourOut;
in vec3 vertexNormalsOut;
in vec3 camDirection;
// Ambient
uniform vec4 ambientLightColor;
uniform vec4 ambientMaterialColor;
// Diffuse
uniform vec3 lightDirection = vec3(0.0f, 0.0f, -1.0f);
uniform vec4 diffuseLightColor = vec4(1.0f, 1.0f, 1.0f, 1.0f);
uniform vec4 diffuseMaterialColor = vec4(1.0f, 1.0f, 1.0f, 1.0f);
// Specular
uniform vec4 specularLightColor = vec4(1.0f, 1.0f, 1.0f, 1.0f);
uniform vec4 specularMaterialColor = vec4(1.0f, 1.0f, 1.0f, 1.0f);
uniform float specularRoughness = 10.0f;

void main()
{
  vec3 halfway = normalize(lightDirection + camDirection);
  float diffuseLightIntensity = clamp(dot(vertexNormalsOut, -lightDirection), 0.0f, 1.0f);
  float specularLightIntensity = pow(clamp(dot(vertexNormalsOut, halfway),0.0f, 1.0f), specularRoughness);

  //colour = (ambientLightColor * ambientMaterialColor);

  colour = (ambientLightColor * ambientMaterialColor) + (diffuseLightColor * diffuseMaterialColor * diffuseLightIntensity) + (specularLightColor * specularMaterialColor * specularLightIntensity);
}