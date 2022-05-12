using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class bodyB
{
    public int len;
    public float box_len;
    public float box_height;
    public float box_width;
    public float top_middle_OS;
    public float top_OS;
    public float side_middle_OS;
    public float side_OS;
    public float len_delta;
    public int torso_type;
    public List<Vector3> cs;
    public List<Color> colors;
    GameObject torso_obj;
    CMesh torso_mesh;
    public int c_count = 10;

    public void initState()
    {
        float top_OS_delta = 1.0f;
        float side_OS_delta = 1.0f;
        len = (int)Utils.weightedRange(new float[] { 3, 4, 7, 7, 9, 10, 12, 14, 12 });
        box_len = len / (float)c_count;
        box_height = box_len;
        box_width = box_len;
        top_middle_OS = Random.Range(0f, 0.5f);
        top_OS = Random.Range(0f, top_middle_OS * top_OS_delta);
        side_middle_OS = Random.Range(0f, 0.5f);
        side_OS = Random.Range(0f, side_middle_OS * side_OS_delta);
        len_delta = Random.Range(0.5f, 0.75f);
        torso_type = Random.Range(0, 3);
        colors = new List<Color>();
        colors.Add(Utils.getBaseColor());
        for (int i = 0; i < Random.Range(1, 5); i++)
        {
            colors.Add(Utils.getHighlightColor());
        }
    }

    public GameObject build()
    {
        torso_obj = new GameObject();
        torso_obj.name = "torso";
        initState();
        buildMesh();
        MeshFilter mesh_filter = (MeshFilter)torso_obj.AddComponent(typeof(MeshFilter));
        MeshRenderer mesh_renderer = (MeshRenderer)torso_obj.AddComponent(typeof(MeshRenderer));
        mesh_filter.mesh = torso_mesh.mesh;
        torso_obj.GetComponent<MeshRenderer>().material = new Material(Shader.Find("Diffuse"));
        Texture2D texture = Utils.makeTexture(torso_mesh.mesh.vertices, "torso", colors);
        Renderer renderer = torso_obj.GetComponent<Renderer>();
        renderer.material.mainTexture = texture;
        return torso_obj;
    }

    public void buildMesh()
    {
        torso_mesh = new CMesh();
        v1Mesh();
    }

    public void v1Mesh()
    {
        cs = new List<Vector3>();
        Vector3 c_pos = new Vector3(0, 0, 0);
        float c_distance = box_len;
        float x_wiggle, y_wiggle, z_direction;
        float width_OS = (box_width / 2f) * 0.75f;
        float height_OS = box_height * 0.75f;
        float[] OSs = new float[2];
        List<Vector2> uvs = new List<Vector2>();
        int new_base, old_base;
        List<Vector3> hard_vertices = new List<Vector3>();
        List<Edge> hard_edges = new List<Edge>();
        Vector3 v0, v1, v2, v3;
        float r;
        for (int i = 0; i < c_count; i++)
        {
            r = i / (float)c_count;
            cs.Add(c_pos);
            if (r < 0.3f)
            {
                c_distance = c_distance * 0.83f;
            }
            else if (r > 0.7f)
            {
                c_distance = box_len * 0.13f;
            }
            else
            {
                c_distance = box_len;
            }
            torso_mesh.geo_table.Add(c_pos + new Vector3(-width_OS, 0f, 0f));
            torso_mesh.geo_table.Add(c_pos + new Vector3(width_OS, 0f, 0f));
            torso_mesh.geo_table.Add(c_pos + new Vector3(width_OS, -height_OS, 0f));
            torso_mesh.geo_table.Add(c_pos + new Vector3(-width_OS, -height_OS, 0f));
            OSs = getOSs(r);
            width_OS = OSs[0];
            height_OS = OSs[1];
            uvs.Add(new Vector2(0f, i / (float)c_count));
            uvs.Add(new Vector2(0.33f, i / (float)c_count));
            uvs.Add(new Vector2(0.66f, i / (float)c_count));
            uvs.Add(new Vector2(1f, i / (float)c_count));
            if (i > 0)
            {
                new_base = i * 4;
                old_base = (i - 1) * 4;
                torso_mesh.addTriangle(new_base, old_base, old_base + 1);
                torso_mesh.addTriangle(new_base, old_base + 1, new_base + 1);
                torso_mesh.addTriangle(old_base + 2, old_base + 3, new_base + 3);
                torso_mesh.addTriangle(new_base + 2, old_base + 2, new_base + 3);
                torso_mesh.addTriangle(old_base + 1, old_base + 2, new_base + 2);
                torso_mesh.addTriangle(old_base + 1, new_base + 2, new_base + 1);
                torso_mesh.addTriangle(new_base + 3, old_base + 3, old_base);
                torso_mesh.addTriangle(new_base, new_base + 3, old_base);
                if (i == c_count - 1)
                {
                    torso_mesh.addTriangle((i * 4) + 2, (i * 4) + 3, (i * 4));
                    torso_mesh.addTriangle((i * 4) + 1, (i * 4) + 2, i * 4);
                }
            }
            else if (i == 0)
            {
                torso_mesh.addTriangle(0, 3, 2);
                torso_mesh.addTriangle(0, 2, 1);
                v0 = torso_mesh.geo_table[0];
                v1 = torso_mesh.geo_table[1];
                v2 = torso_mesh.geo_table[2];
                v3 = torso_mesh.geo_table[3];
                hard_edges.Add(new Edge(v0, v1));
                hard_edges.Add(new Edge(v1, v2));
                hard_edges.Add(new Edge(v2, v3));
                hard_edges.Add(new Edge(v3, v0));
            }
            x_wiggle = 0f;
            y_wiggle = 0f;
            z_direction = -1f;
            if (r > 0.6f)
            {
                y_wiggle = 0.2f;
            }
            c_pos += new Vector3(x_wiggle, y_wiggle, z_direction).normalized * c_distance;
        }
        torso_mesh.mesh.vertices = torso_mesh.geo_table.ToArray();
        torso_mesh.mesh.uv = uvs.ToArray();
        torso_mesh.mesh.triangles = torso_mesh.triangle_table.ToArray();
        torso_mesh.mesh.RecalculateNormals();
        LoopSubdivision.setParam(torso_mesh);
        LoopSubdivision.subdivide(hard_edges, hard_vertices, 2);
    }

    public float[] getOSs(float r)
    {
        if (torso_type == 0)
        {
            return v1OSs(r);
        }
        else if (torso_type == 1)
        {
            return v2OSs(r);
        }
        else
        {
            return v3OSs(r);
        }
    }

    public float[] v1OSs(float r)
    {
        float width_OS = 0f;
        float height_OS = 0f;
        if (r < 0.1f)
        {
            width_OS = (box_width / 2f) * 1.51f;
            height_OS = box_height * 1.53f;
        }
        else if (r < 0.2f)
        {
            width_OS = (box_width / 2f) * 1.71f;
            height_OS = box_height * 1.52f;
        }
        else if (r < 0.3)
        {
            width_OS = (box_width / 2f) * 1.75f;
            height_OS = box_height * 1.52f;
        }
        else if (r < 0.4)
        {
            width_OS = (box_width / 2f) * 2.5f;
            height_OS = box_height * 1.55f;
        }
        else if (r < 0.5)
        {
            width_OS = (box_width / 2f) * 2.45f;
            height_OS = box_height * 1.7f;
        }
        else if (r < 0.6)
        {
            width_OS = (box_width / 2f) * 2.5f;
            height_OS = box_height * 1.55f;
        }
        else if (r < 0.7)
        {
            width_OS = (box_width / 2f) * 2.5f;
            height_OS = box_height * 1.2f;
        }
        else if (r < 0.8)
        {
            width_OS = (box_width / 2f) * 0.83f;
            height_OS = box_height * 1.0f;
        }
        else if (r < 0.9)
        {
            width_OS = (box_width / 2f) * 0.7f;
            height_OS = box_height * 0.73f;
        }
        else if (r < 1.0)
        {
            width_OS = (box_width / 2f) * 0.6f;
            height_OS = box_height * 0.75f;
        }
        return new float[] { width_OS, height_OS };
    }

    public float[] v2OSs(float r)
    {
        float width_OS = 0f;
        float height_OS = 0f;
        if (r < 0.1f)
        {
            width_OS = (box_width / 2f) * 0.83f;
            height_OS = box_height * 1.51f;
        }
        else if (r < 0.2f)
        {
            width_OS = (box_width / 2f) * 2f;
            height_OS = box_height * 1.54f;
        }
        else if (r < 0.3)
        {
            width_OS = (box_width / 2f) * 2.53f;
            height_OS = box_height * 1.52f;
        }
        else if (r < 0.4)
        {
            width_OS = (box_width / 2f) * 3f;
            height_OS = box_height * 1.53f;
        }
        else if (r < 0.5)
        {
            width_OS = (box_width / 2f) * 3.5f;
            height_OS = box_height * 1.53f;
        }
        else if (r < 0.6)
        {
            width_OS = (box_width / 2f) * 3f;
            height_OS = box_height * 1.55f;
        }
        else if (r < 0.7)
        {
            width_OS = (box_width / 2f) * 1.5f;
            height_OS = box_height * 1.2f;
        }
        else if (r < 0.8)
        {
            width_OS = (box_width / 2f) * 0.5f;
            height_OS = box_height * 1.0f;
        }
        else if (r < 0.9)
        {
            width_OS = (box_width / 2f) * 0.4f;
            height_OS = box_height * 0.64f;
        }
        else if (r < 1.0)
        {
            width_OS = (box_width / 2f) * 0.3f;
            height_OS = box_height * 0.5f;
        }
        return new float[] { width_OS, height_OS };
    }

    public float[] v3OSs(float r)
    {
        float width_OS = 0f;
        float height_OS = 0f;
        if (r < 0.1f)
        {
            width_OS = (box_width / 2f) * 0.8f;
            height_OS = box_height * 1.53f;
        }
        else if (r < 0.2f)
        {
            width_OS = (box_width / 2f) * 0.91f;
            height_OS = box_height * 1.54f;
        }
        else if (r < 0.3)
        {
            width_OS = (box_width / 2f) * 0.94f;
            height_OS = box_height * 1.5f;
        }
        else if (r < 0.4)
        {
            width_OS = (box_width / 2f) * 1.1f;
            height_OS = box_height * 1.54f;
        }
        else if (r < 0.5)
        {
            width_OS = (box_width / 2f) * 1.12f;
            height_OS = box_height * 1.5f;
        }
        else if (r < 0.6)
        {
            width_OS = (box_width / 2f) * 1.1f;
            height_OS = box_height * 1.52f;
        }
        else if (r < 0.7)
        {
            width_OS = (box_width / 2f) * 1.1f;
            height_OS = box_height * 1f;
        }
        else if (r < 0.8)
        {
            width_OS = (box_width / 2f) * 1.1f;
            height_OS = box_height * 1.3f;
        }
        else if (r < 0.9)
        {
            width_OS = (box_width / 2f) * 0.75f;
            height_OS = box_height * 0.75f;
        }
        else if (r < 1.0)
        {
            width_OS = (box_width / 2f) * 0.6f;
            height_OS = box_height * 0.7f;
        }
        return new float[] { width_OS, height_OS };
    }
}
