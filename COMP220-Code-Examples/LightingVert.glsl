#version 330 core

layout(location = 0) in vec3 vertexPosition;
layout(location = 1) in vec4 vertexColour;
layout(location = 3) in vec3 vertexNormals;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

uniform vec3 camPosition = vec3(0.0f, 0.0f, 20.0f); // This is cheating

out vec4 vertexColourOut;
out vec3 vertexNormalsOut;
out vec3 camDirection;

void main()
{
	mat4 mvpMatrix=projection*view*model;

	vec3 vertexModelPosition = (model*vec4(vertexPosition, 1.0f)).xyz;

	camDirection = normalize(camPosition - vertexModelPosition);

	vertexColourOut = vertexColour;
	vertexNormalsOut = normalize((model * vec4(vertexNormals, 0.0f)).xyz);

	gl_Position = mvpMatrix * vec4(vertexPosition,1.0f);
}