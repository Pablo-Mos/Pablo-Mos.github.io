using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class legsB
{
    GameObject FRobj, FLobj, BRobj, BLobj;
    public int c_count = 10;
    public cState FRstate;
    public float len;
    public float box_len;
    clawB claw_builder = new clawB();
    GameObject limb_obj;
    CMesh FRmesh;
    public float box_height;
    public float box_width;

    public void initState(bodyB torso_builder)
    {
        c_count = 10;
        len = torso_builder.len / 4f;
        box_len = len / (float)c_count;
        box_height = box_len * 2.6f;
        box_width = box_len * 2.9f;
        initcState(torso_builder);

    }

    public GameObject build(bodyB torso_builder)
    {
        limb_obj = new GameObject();
        limb_obj.name = "limbs";
        initState(torso_builder);
        buildMesh();
        FRobj = new GameObject();
        MeshFilter mesh_filter = (MeshFilter)FRobj.AddComponent(typeof(MeshFilter));
        MeshRenderer mesh_renderer = (MeshRenderer)FRobj.AddComponent(typeof(MeshRenderer));
        mesh_filter.mesh = FRmesh.mesh;
        FRobj.transform.parent = limb_obj.transform;
        FRobj.name = "FRlimb";
        FRobj.GetComponent<MeshRenderer>().material = new Material(Shader.Find("Diffuse"));
        Texture2D texture = Utils.makeTexture(FRmesh.mesh.vertices, "limbs", torso_builder.colors);
        Renderer renderer = FRobj.GetComponent<Renderer>();
        renderer.material.mainTexture = texture;
        claw_builder.build(this, FRobj.transform, torso_builder);
        FLobj = Object.Instantiate(FRobj, limb_obj.transform);
        FLobj.transform.localScale = new Vector3(-1f, 1f, 1f);
        FLobj.name = "FLlimb";
        float back_inward_OS = Random.Range(0.1f, 0.15f);
        Vector3 pos = FRobj.transform.position - new Vector3(-torso_builder.box_width * back_inward_OS, 0, torso_builder.box_len * -5f);
        BRobj = Object.Instantiate(FRobj, pos, Quaternion.identity, limb_obj.transform);
        BRobj.name = "BRlimb";
        BLobj = Object.Instantiate(FLobj, FRobj.transform.position - new Vector3(torso_builder.box_width * back_inward_OS, 0, torso_builder.box_len * -5f), Quaternion.identity, limb_obj.transform);
        BLobj.name = "BLlimb";
        return limb_obj;
    }

    public void initcState(bodyB torso_builder)
    {
        float[] torso_OS = torso_builder.getOSs(0.1f);
        Vector3 front_OS = new Vector3(-torso_OS[0] * 0.75f, -torso_OS[1] / 3f, 0f);
        Vector3 front_start = (torso_builder.cs[torso_builder.cs.Count - 3] + torso_builder.cs[torso_builder.cs.Count - 2]) * 0.5f;
        Vector3 init_pos = front_start + front_OS;
        int type = 0;
        List<float> distances;
        if (type == 0)
        {
            distances = new List<float>() {
                box_len * 1.2f,
                box_len,
                box_len,
                box_len,
                box_len,
                box_len,
                box_len,
                box_len * 0.7f,
                box_len * 0.6f
             };
        }
        else
        {
            distances = new List<float>() {
                box_len,
                box_len,
                box_len,
                box_len,
                box_len,
                box_len,
                box_len,
                box_len,
                box_len,
            };
        }
        List<float> bend_points = new List<float>() { 0.43f };
        List<Vector3> directions = new List<Vector3>() {
            new Vector3(Random.Range(-0.92f, -0.22f), Random.Range(-0.42f, 0f), Random.Range(0.51f, 0.9f)).normalized,
            new Vector3(Random.Range(0f, 0f), Random.Range(-0.33f, -0.3f), Random.Range(-0.7f, -0.22f)).normalized
        };
        type = 0;
        List<Vector2> size_OSs;
        if (type == 0)
        {
            size_OSs = new List<Vector2>() {
                new Vector2(box_width * 0.25f, box_height * 0.25f),
                new Vector2(box_width * 0.24f, box_height * 0.24f),
                new Vector2(box_width * 0.25f, box_height * 0.27f),
                new Vector2(box_width * 0.22f, box_height * 0.26f),
                new Vector2(box_width * 0.27f, box_height * 0.25f),
                new Vector2(box_width * 0.32f, box_height * 0.4f),
                new Vector2(box_width * 0.25f, box_height * 0.3f),
                new Vector2(box_width * 0.21f, box_height * 0.25f),
                new Vector2(box_width * 0.2f, box_height * 0.2f),
                new Vector2(box_width * 0.2f, box_height * 0.2f)
            };
        }
        else
        {
            size_OSs = new List<Vector2>() {
                new Vector2(box_width * 0.51f, box_height * 0.5f),
                new Vector2(box_width * 0.5f, box_height * 0.55f),
                new Vector2(box_width * 0.5f, box_height * 0.5f),
                new Vector2(box_width * 0.53f, box_height * 0.51f),
                new Vector2(box_width * 0.54f, box_height * 0.5f),
                new Vector2(box_width * 0.52f, box_height * 0.5f),
                new Vector2(box_width * 0.51f, box_height * 0.52f),
                new Vector2(box_width * 0.5f, box_height * 0.52f),
                new Vector2(box_width * 0.5f, box_height * 0.53f),
                new Vector2(box_width * 0.51f, box_height * 0.52f)
            };
        }
        FRstate = new cState(init_pos, distances, bend_points, directions, size_OSs);
    }

    public void buildMesh()
    {
        FRmesh = new CMesh();
        float current_c;
        for (int i = 0; i < c_count; i++)
        {
            current_c = i / (float)c_count;
            FRstate.addc();
            addVertices(current_c, FRstate, FRmesh);
            addUvs(FRmesh.uvs, current_c);
            addTriangles(i, FRmesh);
            FRstate.updatepos(current_c);
        }
        FRmesh.mesh.vertices = FRmesh.geo_table.ToArray();
        FRmesh.mesh.uv = FRmesh.uvs.ToArray();
        FRmesh.mesh.triangles = FRmesh.triangle_table.ToArray();
        FRmesh.mesh.RecalculateNormals();
        LoopSubdivision.setParam(FRmesh);
        LoopSubdivision.subdivide(2);
    }

    public void addVertices(float current_c, cState c_state, CMesh c_mesh)
    {
        Vector3 c_pos = c_state.pos;
        Vector3 current_normal = c_state.getNormal(current_c);
        Vector3 next_normal = c_state.getNextNormal(current_c);
        Vector3 current_binormal = c_state.getBinormal(current_c);
        Vector3 next_binormal = c_state.getNextBinormal(current_c);
        float Inter = c_state.getInter(current_c);
        Vector3 normal = Vector3.Lerp(current_normal, next_normal, Inter);
        Vector3 binormal = Vector3.Lerp(current_binormal, next_binormal, Inter);
        Vector2 size_OS = c_state.getSizeOS(current_c);
        float width_OS = size_OS.x;
        float height_OS = size_OS.y;
        c_mesh.geo_table.Add(c_pos + (normal * -width_OS) + (binormal * height_OS));
        c_mesh.geo_table.Add(c_pos + (normal * width_OS) + (binormal * height_OS));
        c_mesh.geo_table.Add(c_pos + (normal * width_OS) + (binormal * -height_OS));
        c_mesh.geo_table.Add(c_pos + (normal * -width_OS) + (binormal * -height_OS));
    }

    public void addUvs(List<Vector2> uvs, float current_c)
    {
        uvs.Add(new Vector2(0f, current_c));
        uvs.Add(new Vector2(0.33f, current_c));
        uvs.Add(new Vector2(0.66f, current_c));
        uvs.Add(new Vector2(1f, current_c));
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
