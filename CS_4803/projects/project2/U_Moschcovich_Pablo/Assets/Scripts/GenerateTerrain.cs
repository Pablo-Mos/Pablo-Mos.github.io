using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GenerateTerrain : MonoBehaviour {

    const int sideLength = 125;
    const int maxHeight = 15;

    public GameObject makeTerrain(Vector2 terrainKey) {
        GameObject terrain = new GameObject();
        Mesh mesh = generateTerrainMesh(terrain, terrainKey);
        terrain.GetComponent<MeshRenderer>().material = new Material(Shader.Find("Diffuse"));
        Texture2D texture = makeTexture(mesh.vertices);
        Renderer renderer = terrain.GetComponent<Renderer>();
        renderer.material.mainTexture = texture;
        terrain.name = "Terrain";
        return terrain;
    }

    Mesh generateTerrainMesh(GameObject terrain, Vector2 terrainKey) {
        MeshFilter meshFilter = (MeshFilter)terrain.AddComponent(typeof(MeshFilter));
        terrain.AddComponent(typeof(MeshRenderer));
        Mesh mesh = new Mesh();
        int verticeIndex = 0;
        int verticesLength = (sideLength + 1) * (sideLength + 1);
        Vector3[] vertices = new Vector3[verticesLength];
        Vector2[] uv = new Vector2[verticesLength];
        float height = 0f;
        for (int z = 0; z <= sideLength; z++) {
            for (int x = 0; x <= sideLength; x++) {
                height = noiseHeight(x + (terrainKey.x - sideLength / 2f), z + (terrainKey.y - sideLength / 2f), terrainKey);
                vertices[verticeIndex] = new Vector3(x + (terrainKey.x - sideLength / 2f), height, z + (terrainKey.y - sideLength / 2f));
                uv[verticeIndex] = new Vector2((float)x / (sideLength), (float)z / (sideLength));
                verticeIndex++;
            }
        }
        int[] triangles = new int[sideLength * sideLength * 6];
        verticeIndex = 0;
        int triangleIndex = 0;
        for (int z = 0; z < sideLength; z++) {
            for (int x = 0; x < sideLength; x++) {
                triangles[triangleIndex] = triangles[triangleIndex + 3] = verticeIndex + 1 + sideLength;
                triangles[triangleIndex + 1] = verticeIndex + 2 + sideLength;
                triangles[triangleIndex + 2] = triangles[triangleIndex + 4] = verticeIndex + 1;
                triangles[triangleIndex + 5] = verticeIndex;
                verticeIndex++;
                triangleIndex += 6;
            }
            verticeIndex++;
        }
        mesh.vertices = vertices;
        mesh.triangles = triangles;
        mesh.uv = uv;
        mesh.RecalculateNormals();
        terrain.GetComponent<MeshFilter>().mesh = mesh;
        return mesh;
    }

    Texture2D makeTexture(Vector3[] vertices) {
        Texture2D texture = new Texture2D (sideLength + 1, sideLength + 1);
        Color[] colors = new Color[(sideLength + 1) * (sideLength + 1)];
        Vector3 vertex = new Vector3();
        int ind = 0;
        for (int z = 0; z < (sideLength + 1); z++) {
            for (int x = 0; x < (sideLength + 1); x++) {
                ind = z * (sideLength + 1) + x;
                vertex = vertices[ind];
                colors[ind] = calcColor(vertex.y, vertex.x, vertex.z);
            }
        }
        texture.wrapMode = TextureWrapMode.Clamp;
        texture.SetPixels(colors);
        texture.Apply();
        return texture;
    }

    Color calcColor(float height, float x, float z) {
        Color color = new Color(0, 0, 0, 1);
        float upperBound = maxHeight + 6;
        if (height >= upperBound * 0.75f) {
            color = new Color(1, 1, 1, 1);
        } else if (height >= upperBound * 0.6f) {
            color = new Color(.2f, .2f, .2f, 1);
        } else if (height >= upperBound * 0.2f) {
            color = new Color(.4f, .7f, .1f, 1);
        } else {
            color = new Color(.3f, .5f, .1f, 1);
        }
        return color;
    }

    float noiseHeight(float x, float z, Vector2 terrainCenter) {
        float distance = Vector2.Distance(new Vector2(x, z), terrainCenter);
        float heightScale = (distance + 0.1f) / (sideLength / 1.8f);
        float pX = (x / 15f) + 500f;
        float pZ = (z / 15f) + 500f;

        float noiseHeight = maxHeight * (Mathf.PerlinNoise(pX, pZ) +
                        (0.5f * Mathf.PerlinNoise(2f * pX, 2f * pZ)) +
                        (0.25f * Mathf.PerlinNoise(4f * pX, 4f * pZ)));

        return noiseHeight * heightScale;
    }
}
