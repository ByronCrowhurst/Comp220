#pragma once

#include <assimp\Importer.hpp>
#include <assimp\scene.h>
#include <assimp\postprocess.h>

#include <string>
#include <vector>

#include <GL\glew.h>
#include <SDL_opengl.h>

#include "Vertex.h"
#include "Mesh.h"

bool loadModelFromFile(const std::string& filename, GLuint VBO, GLuint EBO, unsigned int& numVerts, unsigned int& numIndices);

bool loadMeshCollectionFromFile(const std::string& filename, MeshCollection* pMeshCollection);