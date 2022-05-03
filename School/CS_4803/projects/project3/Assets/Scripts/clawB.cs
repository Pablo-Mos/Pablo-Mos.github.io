using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class clawB
{
    GameObject FRobj, FLobj, BRobj, BLobj;
    List<CMesh> clawMeshes;
    List<cState> clawStates;
    public Vector3 init_pos;
    public int c_count = 4;
    public int clawCount = 4;
    GameObject claws_obj;
    public float len;
    public int clawType;
    public float box_len;
    public float box_height;
    public float box_width;

    public void initState(legsB limb_builder)
    {
        len = limb_builder.len / 4.5f;
        box_len = len / (float)c_count;
        box_height = box_len;
        box_width = box_len;
        clawType = Random.Range(0, 4);
        List<Vector3> cs = limb_builder.FRstate.cs;
        int end_index = cs.Count - 1;
        init_pos = (0.5f * cs[end_index]) + (0.5f * cs[end_index - 1]);
        if (clawType == 0)
        {
            init0State();
        }
        else if (clawType == 1)
        {
            init1State();
        }
        else if (clawType == 2)
        {
            init2State();
        }
        else
        {
            initDefaultState();
        }
    }

    public GameObject build(legsB limb_builder, Transform _parent_transform, bodyB torso_builder)
    {
        claws_obj = new GameObject();
        claws_obj.name = "claws";
        claws_obj.transform.parent = _parent_transform;
        initState(limb_builder);
        clawMeshes = new List<CMesh>();
        foreach (cState clawStates in clawStates)
        {
            clawMeshes.Add(buildMesh(clawStates));
        }
        FRobj = new GameObject();
        FRobj.name = "FRclaws";
        FRobj.transform.parent = claws_obj.transform;
        GameObject clawObj;
        for (int i = 0; i < clawCount; i++)
        {
            clawObj = new GameObject();
            clawObj.name = "claw " + i;
            MeshFilter mesh_filter = (MeshFilter)clawObj.AddComponent(typeof(MeshFilter));
            MeshRenderer mesh_renderer = (MeshRenderer)clawObj.AddComponent(typeof(MeshRenderer));
            mesh_filter.mesh = clawMeshes[i].mesh;
            clawObj.transform.parent = FRobj.transform;
            clawObj.GetComponent<MeshRenderer>().material = new Material(Shader.Find("Diffuse"));
            Texture2D texture = Utils.makeTexture(clawMeshes[i].mesh.vertices, "claws", torso_builder.colors);
            Renderer renderer = clawObj.GetComponent<Renderer>();
            renderer.material.mainTexture = texture;
        }
        return claws_obj;
    }

    public void init0State()
    {
        clawStates = new List<cState>();
        List<Vector3> clawDirs = new List<Vector3>() {
                new Vector3(0f, 0f, -1f).normalized,
                new Vector3(-0.5f, 0f, -0.5f).normalized,
                new Vector3(0.5f, 0f, -0.5f).normalized,
                new Vector3(-1f, 0f, 0f).normalized,
                new Vector3(1f, 0f, 0f).normalized,
            };
        for (int i = 0; i < clawCount; i++)
        {
            List<float> distances = new List<float>() {
                    box_len,
                    box_len,
                    box_len,
                    box_len * 2f,
                };
            List<float> bend_points = new List<float>();
            List<Vector3> directions = new List<Vector3>() {
                    clawDirs[i],
                };
            List<Vector2> size_OSs = new List<Vector2>() {
                    new Vector2(box_width * 0.15f, box_height * 0.15f),
                    new Vector2(box_width * 0.25f, box_height * 0.25f),
                    new Vector2(box_width * 0.7f, box_height * 0.1f),
                    new Vector2(box_width * 0.7f, box_height * 0.1f),
                    new Vector2(box_width * 0.1f, box_height * 0.25f),
                };
            clawStates.Add(new cState(init_pos, distances, bend_points, directions, size_OSs));
        }
    }

    public void init2State()
    {
        clawStates = new List<cState>();
        List<Vector3> clawDirs = new List<Vector3>() {
                new Vector3(0f, 0f, -1f).normalized,
                new Vector3(-0.2f, 0f, -0.5f).normalized,
                new Vector3(0.2f, 0f, -0.5f).normalized,
                new Vector3(-0.5f, 0f, -0.5f).normalized,
                new Vector3(0.4f, 0f, -0.5f).normalized,
            };
        List<float> base_len = new List<float>() {
                box_len * 2f,
                box_len * 1.7f,
                box_len * 1.8f,
                box_len * 1.2f,
                box_len,
            };
        for (int i = 0; i < clawCount; i++)
        {
            List<float> distances = new List<float>() {
                    base_len[i],
                    base_len[i],
                    base_len[i],
                    base_len[i],
                };
            List<float> bend_points = new List<float>() {
                    0.2f,
                    0.4f,
                };
            List<Vector3> directions = new List<Vector3>() {
                    clawDirs[i],
                    Vector3.Normalize(clawDirs[i] + new Vector3(Random.Range(-0.25f, 0.25f), 0f, 0f)),
                    Vector3.Normalize(clawDirs[i] + new Vector3(Random.Range(-0.25f, 0.25f), 0f, 0f)),
                };
            List<Vector2> size_OSs = new List<Vector2>() {
                    new Vector2(box_width * 0.3f, box_height * 0.3f),
                    new Vector2(box_width * 0.3f, box_height * 0.3f),
                    new Vector2(box_width * 0.2f, box_height * 0.2f),
                    new Vector2(box_width * 0.2f, box_height * 0.2f),
                    new Vector2(box_width * 0.05f, box_height * 0.05f),
                };
            clawStates.Add(new cState(init_pos, distances, bend_points, directions, size_OSs));
        }
    }

    public void init1State()
    {
        clawStates = new List<cState>();
        List<Vector3> clawDirs = new List<Vector3>() {
                new Vector3(0f, 0f, -1f).normalized,
                new Vector3(-0.2f, 0f, -0.5f).normalized,
                new Vector3(0.2f, 0f, -0.5f).normalized,
                new Vector3(-1f, 0f, -0.5f).normalized,
                new Vector3(0.4f, 0f, -0.5f).normalized,
            };
        List<float> base_len = new List<float>() {
                box_len * 1f,
                box_len * 1f,
                box_len * 1f,
                box_len * 1f,
                box_len * 1f
            };
        for (int i = 0; i < clawCount; i++)
        {
            List<float> distances = new List<float>() {
                    base_len[i],
                    base_len[i],
                    base_len[i],
                    base_len[i],
                };
            List<float> bend_points = new List<float>() {
                    0.2f,
                    0.4f,
                };
            List<Vector3> directions = new List<Vector3>() {
                    clawDirs[i],
                    Vector3.Normalize(clawDirs[i] + new Vector3(Random.Range(-0.1f, 0.1f), 1f, 0f)),
                    Vector3.Normalize(clawDirs[i] + new Vector3(Random.Range(-0.1f, 0.1f), -1f, 0f)),
                };
            List<Vector2> size_OSs = new List<Vector2>() {
                    new Vector2(box_width * 0.3f, box_height * 0.3f),
                    new Vector2(box_width * 0.3f, box_height * 0.3f),
                    new Vector2(box_width * 0.2f, box_height * 0.2f),
                    new Vector2(box_width * 0.2f, box_height * 0.2f),
                    new Vector2(box_width * 0.05f, box_height * 0.05f),
                };
            clawStates.Add(new cState(init_pos, distances, bend_points, directions, size_OSs));
        }
    }

    public void initDefaultState()
    {
        clawStates = new List<cState>();
        List<Vector3> clawDirs = new List<Vector3>() {
                new Vector3(0f, 0f, -1f).normalized,
                new Vector3(-0.5f, 0f, -0.5f).normalized,
                new Vector3(0.5f, 0f, -0.5f).normalized,
                new Vector3(-1f, 0f, 0f).normalized,
                new Vector3(1f, 0f, 0f).normalized,
            };
        for (int i = 0; i < clawCount; i++)
        {
            List<float> distances = new List<float>() {
                    box_len,
                    box_len,
                    box_len,
                    box_len,
                };
            List<float> bend_points = new List<float>();
            List<Vector3> directions = new List<Vector3>() {
                    clawDirs[i],
                };
            List<Vector2> size_OSs = new List<Vector2>() {
                    new Vector2(box_width * 0.25f, box_height * 0.75f),
                    new Vector2(box_width * 0.4f, box_height * 0.25f),
                    new Vector2(box_width * 0.3f, box_height * 0.1f),
                    new Vector2(box_width * 0.4f, box_height * 0.1f),
                    new Vector2(box_width * 0.5f, box_height * 0.25f),
                };
            clawStates.Add(new cState(init_pos, distances, bend_points, directions, size_OSs));
        }
    }

    public CMesh buildMesh(cState clawStates)
    {
        CMesh clawMesh = new CMesh();
        float curr_c;
        for (int i = 0; i < c_count; i++)
        {
            curr_c = i / (float)c_count;
            clawStates.addc();
            addVertices(curr_c, clawStates, clawMesh);
            addUvs(clawMesh.uvs, curr_c);
            addTriangles(i, clawMesh);
            clawStates.updatepos(curr_c);
        }
        clawMesh.mesh.vertices = clawMesh.geo_table.ToArray();
        clawMesh.mesh.uv = clawMesh.uvs.ToArray();
        clawMesh.mesh.triangles = clawMesh.triangle_table.ToArray();
        clawMesh.mesh.RecalculateNormals();
        LoopSubdivision.setParam(clawMesh);
        LoopSubdivision.subdivide(2);
        return clawMesh;
    }

    public void addVertices(float curr_c, cState c_state, CMesh c_mesh)
    {
        Vector3 c_pos = c_state.pos;
        Vector3 curr_normal = c_state.getNormal(curr_c);
        Vector3 next_normal = c_state.getNextNormal(curr_c);
        Vector3 curr_binormal = c_state.getBinormal(curr_c);
        Vector3 next_binormal = c_state.getNextBinormal(curr_c);
        float Inter = c_state.getInter(curr_c);
        Vector3 normal = Vector3.Lerp(curr_normal, next_normal, Inter);
        Vector3 binormal = Vector3.Lerp(curr_binormal, next_binormal, Inter);
        Vector2 size_OS = c_state.getSizeOS(curr_c);
        float width_OS = size_OS.x;
        float height_OS = size_OS.y;
        c_mesh.geo_table.Add(c_pos + (normal * -width_OS) + (binormal * height_OS));
        c_mesh.geo_table.Add(c_pos + (normal * width_OS) + (binormal * height_OS));
        c_mesh.geo_table.Add(c_pos + (normal * width_OS) + (binormal * -height_OS));
        c_mesh.geo_table.Add(c_pos + (normal * -width_OS) + (binormal * -height_OS));
    }

    public void addUvs(List<Vector2> uvs, float curr_c)
    {
        uvs.Add(new Vector2(0f, curr_c));
        uvs.Add(new Vector2(0.33f, curr_c));
        uvs.Add(new Vector2(0.66f, curr_c));
        uvs.Add(new Vector2(1f, curr_c));
    }

    public void addTriangles(int i, CMesh c_mesh)
    {
        Vector3 v0, v1, v2, v3;
        if (i > 0)
        {
            int new_base = i * 4;
            int old_base = (i - 1) * 4;
            c_mesh.addTriangle(old_base + 1, old_base, new_base);
            c_mesh.addTriangle(new_base + 1, old_base + 1, new_base);
            c_mesh.addTriangle(new_base + 3, old_base + 3, old_base + 2);
            c_mesh.addTriangle(new_base + 3, old_base + 2, new_base + 2);
            c_mesh.addTriangle(new_base + 2, old_base + 2, old_base + 1);
            c_mesh.addTriangle(new_base + 1, new_base + 2, old_base + 1);
            c_mesh.addTriangle(old_base, old_base + 3, new_base + 3);
            c_mesh.addTriangle(old_base, new_base + 3, new_base);
            if (i == c_count - 1)
            {
                c_mesh.addTriangle(i * 4, (i * 4) + 3, (i * 4) + 2);
                c_mesh.addTriangle(i * 4, (i * 4) + 2, (i * 4) + 1);
            }
        }
        else if (i == 0)
        {
            c_mesh.addTriangle(2, 3, 0);
            c_mesh.addTriangle(1, 2, 0);
            v0 = c_mesh.geo_table[0];
            v1 = c_mesh.geo_table[1];
            v2 = c_mesh.geo_table[2];
            v3 = c_mesh.geo_table[3];
            c_mesh.hard_edges.Add(new Edge(v0, v1));
            c_mesh.hard_edges.Add(new Edge(v1, v2));
            c_mesh.hard_edges.Add(new Edge(v2, v3));
            c_mesh.hard_edges.Add(new Edge(v3, v0));
        }

    }
}
