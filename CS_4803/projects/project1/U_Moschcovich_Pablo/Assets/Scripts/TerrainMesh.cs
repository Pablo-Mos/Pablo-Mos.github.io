using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TerrainMesh : MonoBehaviour {

    Dictionary<Vector2, string> terrainMap = new Dictionary<Vector2, string>();
    Dictionary<Vector2, int[,]> terrainToTreeMap = new Dictionary<Vector2, int[,]>();
    Dictionary<Vector2, int[,]> terrainToFlowerMap = new Dictionary<Vector2, int[,]>();
    float createDist = 0.01f;
    float delDist = 0f;
    int terrainCount = 0;
    int sideLength = 50;
    const int maxHeight = 15;
    Camera MainCamera;
    public GameObject Tree;
    public GameObject Flower;
    // translate and rotate sensitivity factors
    float translateFactor = 0.3f;
    float rotateFactor = 5.0f;
    void Start () {
        // cache the main camera
        print("START");
        MainCamera = Camera.main;
        delDist = sideLength * 2;

        Vector3 camPos = MainCamera.transform.position;
        Vector2 terrainKey = new Vector2(0, 0);
        int pieceLen = 4;
        print(pieceLen);
        for (float x = camPos.x - (pieceLen * sideLength); x < camPos.x + (pieceLen * sideLength); x += sideLength) {
            for (float z = camPos.z - (pieceLen * sideLength); z < camPos.z + (pieceLen * sideLength); z += sideLength) {
                terrainKey = new Vector2(x, z);
                if (Mathf.Abs(camPos.x - Mathf.Abs(x)) <= 50 && Mathf.Abs(camPos.z - Mathf.Abs(z)) <= 50) {
                    terrainToTreeMap.Add(terrainKey, createTreeMap(terrainKey));
                    terrainToFlowerMap.Add(terrainKey, createFlowerMap(terrainKey));
                    terrainMap.Add(terrainKey, createTerrain(terrainKey));
                } else {
                    terrainToTreeMap.Add(terrainKey, createMap(terrainKey));
                    terrainToFlowerMap.Add(terrainKey, createMap(terrainKey));
                    terrainMap.Add(terrainKey, createTerrain(terrainKey));
                }
            }
        }


    }

    int[,] createMap(Vector2 terrainKey) {
        int[,] map = new int[sideLength + 1, sideLength + 1];
        print(map[0, 0]);
        return map;
    }

    // Moves camera, updating terrain when needed
    void Update () {
        handleInput();
        checkTerrains();
        updateCameraPosition();
    }

    void updateCameraPosition() {
        if (MainCamera.transform.position.y < noiseHeight(MainCamera.transform.position.x, MainCamera.transform.position.z) + 10) {
            MainCamera.transform.position = new Vector3(MainCamera.transform.position.x, noiseHeight(MainCamera.transform.position.x, MainCamera.transform.position.z) + 10, MainCamera.transform.position.z);
        }
    }

    string createTerrain(Vector2 terrainKey) {
        terrainCount++;
        GameObject terrain = new GameObject();
        terrain.name = "Terrain #" + terrainCount;

        Mesh mesh = makeTerrainMesh(terrain, terrainKey);
        terrain.GetComponent<MeshRenderer>().material = new Material(Shader.Find("Diffuse"));
        Texture2D texture = makeTexture(terrainKey, mesh.vertices);
        Renderer renderer = terrain.GetComponent<Renderer>();
        renderer.material.mainTexture = texture;

        return terrain.name;
    }

    Mesh makeTerrainMesh(GameObject terrain, Vector2 terrainKey) {
        MeshFilter meshFilter = (MeshFilter)terrain.AddComponent(typeof(MeshFilter));
        terrain.AddComponent(typeof(MeshRenderer));
        Mesh mesh = new Mesh();
        int verticeind = 0;
        int verticesLength = (sideLength + 1) * (sideLength + 1);
        Vector3[] vertices = new Vector3[verticesLength];
        Vector2[] uv = new Vector2[verticesLength];
        Vector3[] normals = new Vector3[verticesLength];
        float height = 0f;
        for (int z = 0; z <= sideLength; z++) {
            for (int x = 0; x <= sideLength; x++) {
                height = noiseHeight(x + (terrainKey.x - sideLength / 2f), z + (terrainKey.y - sideLength / 2f));
                vertices[verticeind] = new Vector3(x + (terrainKey.x - sideLength / 2f), height, z + (terrainKey.y - sideLength / 2f));
                uv[verticeind] = new Vector2((float)x / (sideLength), (float)z / (sideLength));
                verticeind++;
            }
        }

        int[] tris = new int[sideLength * sideLength * 6];

        verticeind = 0;
        int triind = 0;
        for (int z = 0; z < sideLength; z++) {
            for (int x = 0; x < sideLength; x++) {
                tris[triind] = tris[triind + 3] = verticeind + 1 + sideLength;
                tris[triind + 1] = verticeind + 2 + sideLength;
                tris[triind + 2] = tris[triind + 4] = verticeind + 1;
                tris[triind + 5] = verticeind;
                verticeind++;
                triind += 6;
            }
            verticeind++;
        }

        // saves the vertices and triangles in the object
        mesh.vertices = vertices;
        mesh.triangles = tris;
        mesh.uv = uv;

        //normals and spawning of trees/flowers
        int[,] flowerMap = new int[sideLength + 1, sideLength + 1];
        int[,] treeMap = new int[sideLength + 1, sideLength + 1];
        terrainToTreeMap.TryGetValue(terrainKey, out treeMap);
        terrainToFlowerMap.TryGetValue(terrainKey, out flowerMap);
        mesh.RecalculateNormals();
        verticeind = 0;
        for (int z = 0; z <= sideLength; z++) {
            for (int x = 0; x <= sideLength; x++) {
                if (z == 0 || z == sideLength || x == 0 || x == sideLength) {
                    normals[verticeind] = normCalc(vertices[verticeind]);
                } else {
                    normals[verticeind] = mesh.normals[verticeind];
                }
                //if on map check the terrain height to add tree/flower
                if (treeMap[x, z] == 1) {
                    addTree(vertices[verticeind], terrain, normals[verticeind]);
                }
                if (flowerMap[x, z] == 1) {
                    addFlower(vertices[verticeind], terrain, normals[verticeind]);
                }
                verticeind++;
            }
        }
        mesh.normals = normals;
        terrain.GetComponent<MeshFilter>().mesh = mesh;
        return mesh;
    }

    Vector3 normCalc(Vector3 vertex) {
        Vector3 leftNext = new Vector3(vertex.x - 1, noiseHeight(vertex.x - 1, vertex.z), vertex.z);
        Vector3 rightNext = new Vector3(vertex.x + 1, noiseHeight(vertex.x + 1, vertex.z), vertex.z);
        Vector3 topNext = new Vector3(vertex.x, noiseHeight(vertex.x, vertex.z + 1), vertex.z + 1);
        Vector3 bottomNext = new Vector3(vertex.x, noiseHeight(vertex.x, vertex.z - 1), vertex.z - 1);
        Vector3 v1 = rightNext - vertex;
        Vector3 v2 = topNext - vertex;
        Vector3 v3 = leftNext - vertex;
        Vector3 v4 = bottomNext - vertex;
        Vector3 n1 = Vector3.Cross(v2, v1).normalized;
        Vector3 n2 = Vector3.Cross(v1, v4).normalized;
        Vector3 n3 = Vector3.Cross(v3, v2).normalized;
        Vector3 n4 = Vector3.Cross(v4, v3).normalized;
        Vector3 surfaceNormal = Vector3.Normalize(n1 + n2 + n3 + n4);
        return surfaceNormal;
    }
    
    Texture2D makeTexture(Vector2 terrainKey, Vector3[] vertices) {
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

    void addFlower(Vector3 vertex, GameObject terrain, Vector3 normal) {
        float upperBound = maxHeight + 4;
        if (vertex.y < upperBound * 0.6f && vertex.y >= upperBound * 0.4f) {
            GameObject flower = (GameObject) Instantiate(Flower);
            flower.transform.position = new Vector3(Random.Range(vertex.x - 1f, vertex.x + 1f), vertex.y, Random.Range(vertex.z - 1f, vertex.z + 1f));
            flower.transform.localScale = flower.transform.localScale * Random.Range(0.25f, 0.35f);
            flower.transform.parent = terrain.transform;
        }
    }

    void addTree(Vector3 vertex, GameObject terrain, Vector3 normal) {
        float upperBound = maxHeight + 3;
        if (vertex.y < upperBound * 0.6f && vertex.y >= upperBound * 0.4f) {
            GameObject tree = (GameObject) Instantiate(Tree);
            tree.transform.position = new Vector3(Random.Range(vertex.x - 0.5f, vertex.x + 0.5f), vertex.y, Random.Range(vertex.z - 0.5f, vertex.z + 0.5f));
            tree.transform.localScale = tree.transform.localScale * Random.Range(0.5f, 1f);
            tree.transform.parent = terrain.transform;
        }
    }

    Color calcColor(float height, float x, float z) {
        Color color = new Color(0, 0, 0, 1);
        float upperBound = maxHeight + 6;
        if (height >= upperBound * 0.8f) {
            color = new Color(1, 1, 1, 1);
        } else if (height >= upperBound * 0.7f) {
            color = new Color(.2f, .2f, .2f, 1);
        } else if (height >= upperBound * 0.3f) {
            color = new Color(.4f, .5f, .1f, 1);
        } else {
            color = new Color(.5f, .7f, .8f, 1);
        }
        return color;
    }

    float noiseHeight(float x, float z) {
        float pX = (x / 15f) + 500f;
        float pZ = (z / 15f) + 500f;
        float noiseHeight = maxHeight * (Mathf.PerlinNoise(pX, pZ) +
                        (0.5f * Mathf.PerlinNoise(2f * pX, 2f * pZ)) +
                        (0.25f * Mathf.PerlinNoise(4f * pX, 4f * pZ)));
        return noiseHeight;
    }

    void delTerrain(Vector2 terrainKey) {
        terrainCount--;
        string terrainName = "";
        terrainMap.TryGetValue(terrainKey, out terrainName);
        GameObject terrainToGo = GameObject.Find(terrainName);
        Destroy(terrainToGo);
        terrainMap.Remove(terrainKey);
        terrainToTreeMap.Remove(terrainKey);
        terrainToFlowerMap.Remove(terrainKey);
    }

    void handleInput() {
        // get the horizontal and verticle controls
        float dx = Input.GetAxis ("Horizontal");
        float dz = Input.GetAxis ("Vertical");

        //get space and shift Input
        if (Input.GetKeyDown("space")) {
            MainCamera.transform.Translate(0, 1, 0);
        }
        if (Input.GetKeyDown("left shift")) {
            MainCamera.transform.Translate(0, -1, 0);
        }

        //turn left or right
        MainCamera.transform.Rotate (0, dx * rotateFactor, 0);
        //move forward or backwards
        MainCamera.transform.Translate (0, 0, dz * translateFactor);
    }

    void checkTerrains() {
        // get the main camera position
        Vector3 camPos = MainCamera.transform.position;
        Vector2 modCamPos = new Vector2(camPos.x, camPos.z);

        // make terrain if the camera has moved far enough
        Vector2 currentKey = closestKey(modCamPos);
        if (Vector2.Distance(currentKey, modCamPos) > createDist) {
            Vector2 diff = modCamPos - currentKey;
            Vector2 newKeyNE = new Vector2(currentKey.x + (sideLength * Mathf.Sign(diff.x)),
                                        currentKey.y + (sideLength * Mathf.Sign(diff.y)));
            Vector2 newKeyNW = new Vector2(currentKey.x + (sideLength * -Mathf.Sign(diff.x)),
                                        currentKey.y + (sideLength * Mathf.Sign(diff.y)));
            Vector2 newKeyE = new Vector2(currentKey.x + (sideLength * Mathf.Sign(diff.x)), currentKey.y);
            Vector2 newKeyW = new Vector2(currentKey.x + (sideLength * -Mathf.Sign(diff.x)), currentKey.y);
            Vector2 newKeyN = new Vector2(currentKey.x, currentKey.y + (sideLength * Mathf.Sign(diff.y)));
            Vector2[] newKeys = {newKeyNW, newKeyE, newKeyW, newKeyNE, newKeyN};
            for (int i = 0; i < newKeys.Length; i++) {
                Vector2 terrainKey = newKeys[i];
                if (!terrainMap.ContainsKey(terrainKey)) {
                    terrainToTreeMap.Add(terrainKey, createTreeMap(terrainKey));
                    terrainToFlowerMap.Add(terrainKey, createFlowerMap(terrainKey));
                    terrainMap.Add(terrainKey, createTerrain(terrainKey));
                }
            }
        }

        //remove terrains that are too far away and not needed
        if (terrainCount > 4) {
            List<Vector2> badTerrainKeys = new List<Vector2>();
            foreach (Vector2 key in terrainMap.Keys) {
                if (Vector2.Distance(key, modCamPos) > delDist) {
                    badTerrainKeys.Add(key);
                }
            }
            foreach (Vector2 key in badTerrainKeys) {
                delTerrain(key);
            }
        }
    }

    Vector2 closestKey(Vector2 camPos) {
        float minDist = Mathf.Infinity;
        Vector2 lowest = new Vector2(0, 0);
        float currentDist = 0.0f;
        foreach (Vector2 key in terrainMap.Keys) {
            currentDist = Vector2.Distance(key, camPos);
            if (currentDist < minDist) {
                lowest = key;
                minDist = currentDist;
            }
        }
        return lowest;
    }

    int[,] createTreeMap(Vector2 terrainKey) {
        int seed = (5 * (int)terrainKey.x) + (5 * (int)terrainKey.y);
        Random.InitState(seed);
        int[,] map = new int[sideLength + 1, sideLength + 1];
        int totalTimes = 4;
        for (int z = 0; z <= sideLength; z++) {
            for (int x = 0; x <= sideLength; x++) {
                if (z == 0 || z == sideLength || x == 0 || x == sideLength) {
                    map[x, z] = 0;
                } else if (Random.value <= 0.3) {
                    map[x, z] = 1;
                } else {
                    map[x, z] = 0;
                }
            }
        }
        return map;
    }

    int[,] createFlowerMap(Vector2 terrainKey) {
        int seed = (10 * (int)terrainKey.x) + (5 * (int)terrainKey.y);
        Random.InitState(seed);
        int[,] map = new int[sideLength + 1, sideLength + 1];
        int totalTimes = 4;
        for (int z = 0; z <= sideLength; z++) {
            for (int x = 0; x <= sideLength; x++) {
                if (Random.value <= 0.3) {
                    map[x, z] = 1;
                } else {
                    map[x, z] = 0;
                }
            }
        }
        return map;
    }
}