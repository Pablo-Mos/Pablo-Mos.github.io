using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class tailB
{
    GameObject tail_obj;
    CMesh tail_mesh;
    enum tail_types
    {
        v0,
        v1,
        v2,
        v3,
        v4,
        v5,
        v6,
    };

    public int type;
    public int c_count;
    public float len;
    public float box_len;
    public float box_height;
    public float box_width;
    public float top_middle_OS;
    public float top_OS;
    public float side_middle_OS;
    public float side_OS;

    public void initState(bodyB torso_builder)
    {
        float top_OS_delta = 1.0f;
        float side_OS_delta = 1.0f;
        type = Random.Range(0, 5);
        c_count = Random.Range(6, 15);
        len = torso_builder.len * Random.Range(2f, 4f);
        box_len = len / (float)c_count;
        box_height = torso_builder.box_height * 0.75f;
        box_width = torso_builder.box_width * 0.75f;
        top_middle_OS = Random.Range(0f, 0.5f);
        top_OS = Random.Range(0f, top_middle_OS * top_OS_delta);
        side_middle_OS = Random.Range(0f, 0.5f);
        side_OS = Random.Range(0f, side_middle_OS * side_OS_delta);
    }

    public void buildMesh()
    {
        tail_mesh = new CMesh();
        int tail_type = 0;
        switch (tail_type)
        {
            case (int)tail_types.v0:
                v0Mesh();
                break;
        }
    }

    public GameObject build(bodyB torso_builder)
    {
        tail_obj = new GameObject();
        tail_obj.name = "tail";
        initState(torso_builder);
        buildMesh();
        MeshFilter mesh_filter = (MeshFilter)tail_obj.AddComponent(typeof(MeshFilter));
        MeshRenderer mesh_renderer = (MeshRenderer)tail_obj.AddComponent(typeof(MeshRenderer));
        mesh_filter.mesh = tail_mesh.mesh;
        tail_obj.GetComponent<MeshRenderer>().material = new Material(Shader.Find("Diffuse"));
        Texture2D texture = Utils.makeTexture(tail_mesh.mesh.vertices, "tail", torso_builder.colors);
        Renderer renderer = tail_obj.GetComponent<Renderer>();
        renderer.material.mainTexture = texture;
        return tail_obj;
    }

    public void v0Mesh()
    {
        List<Vector3> cs = new List<Vector3>();
        Vector3 c_pos = new Vector3(0, 0, -0.05f);
        float c_distance = box_len;
        float x_wiggle, y_wiggle, z_direction;
        float width_OS = box_width / 2f;
        float height_OS = box_height;
        List<Vector2> uvs = new List<Vector2>();
        int new_base, old_base;
        List<Vector3> hard_vertices = new List<Vector3>();
        List<Edge> hard_edges = new List<Edge>();
        Vector3 v0, v1, v2, v3;
        for (int i = 0; i < c_count; i++)
        {
            cs.Add(c_pos);
            c_distance *= 0.8f;
            tail_mesh.geo_table.Add(c_pos + new Vector3(-width_OS, 0f, 0f));
            tail_mesh.geo_table.Add(c_pos + new Vector3(width_OS, 0f, 0f));
            tail_mesh.geo_table.Add(c_pos + new Vector3(width_OS, -height_OS, 0f));
            tail_mesh.geo_table.Add(c_pos + new Vector3(-width_OS, -height_OS, 0f));
            width_OS *= 0.75f;
            height_OS *= 0.75f;
            uvs.Add(new Vector2(0f, i / (float)c_count));
            uvs.Add(new Vector2(0.33f, i / (float)c_count));
            uvs.Add(new Vector2(0.66f, i / (float)c_count));
            uvs.Add(new Vector2(1f, i / (float)c_count));
            if (i > 0)
            {
                new_base = i * 4;
                old_base = (i - 1) * 4;
                tail_mesh.addTriangle(old_base + 1, old_base, new_base);
                tail_mesh.addTriangle(new_base + 1, old_base + 1, new_base);
                tail_mesh.addTriangle(new_base + 3, old_base + 3, old_base + 2);
                tail_mesh.addTriangle(new_base + 3, old_base + 2, new_base + 2);
                tail_mesh.addTriangle(new_base + 2, old_base + 2, old_base + 1);
                tail_mesh.addTriangle(new_base + 1, new_base + 2, old_base + 1);
                tail_mesh.addTriangle(old_base, old_base + 3, new_base + 3);
                tail_mesh.addTriangle(old_base, new_base + 3, new_base);
                if (i == c_count - 1)
                {
                    tail_mesh.addTriangle(i * 4, (i * 4) + 3, (i * 4) + 2);
                    tail_mesh.addTriangle(i * 4, (i * 4) + 2, (i * 4) + 1);
                }
            }
            else if (i == 0)
            {
                tail_mesh.addTriangle(2, 3, 0);
                tail_mesh.addTriangle(1, 2, 0);
                v0 = tail_mesh.geo_table[0];
                v1 = tail_mesh.geo_table[1];
                v2 = tail_mesh.geo_table[2];
                v3 = tail_mesh.geo_table[3];
                hard_edges.Add(new Edge(v0, v1));
                hard_edges.Add(new Edge(v1, v2));
                hard_edges.Add(new Edge(v2, v3));
                hard_edges.Add(new Edge(v3, v0));
            }
            x_wiggle = Random.Range(-0.5f, 0.5f);
            y_wiggle = Random.Range(-0.25f, 0.1f);
            z_direction = 1f;
            c_pos += new Vector3(x_wiggle, y_wiggle, z_direction).normalized * c_distance;
        }
        tail_mesh.mesh.vertices = tail_mesh.geo_table.ToArray();
        tail_mesh.mesh.uv = uvs.ToArray();
        tail_mesh.mesh.triangles = tail_mesh.triangle_table.ToArray();
        tail_mesh.mesh.RecalculateNormals();
        LoopSubdivision.setParam(tail_mesh);
        LoopSubdivision.subdivide(hard_edges, hard_vertices, 2);
    }
}