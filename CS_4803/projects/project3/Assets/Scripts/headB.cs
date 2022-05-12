using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class headB
{
    public float len;
    public float box_len;
    public float box_height;
    public float box_width;
    public int head_type;
    GameObject head_obj;
    CMesh head_mesh;
    CMesh mouth_mesh;
    public int c_count = 10;
    public cState head_state;
    public cState mouth_state;
    public Vector3 init_pos;
    public Vector3 mouth_init_pos;

    public void initState(bodyB torso_builder)
    {
        c_count = 10;
        len = torso_builder.len / 4f;
        box_len = len / (float)c_count;
        box_height = box_len * 3f;
        box_width = box_len * 5f;
        init_pos = (0.5f * torso_builder.cs[torso_builder.cs.Count - 1]) + (0.5f * torso_builder.cs[torso_builder.cs.Count - 2]);
        init_pos -= new Vector3(0, torso_builder.box_height * 0.75f, 0);
        mouth_init_pos = init_pos + new Vector3(0f, torso_builder.box_height * 0.25f, 0f);
        head_type = Random.Range(0, 3);
        if (head_type == 0)
        {
            initStartState();
        }
        else if (head_type == 1)
        {
            init0State();
        }
        else if (head_type == 2)
        {
            init1State();
        }
    }

    public void initStartState()
    {
        float base_len = box_len * Random.Range(0.5f, 0.7f);
        List<float> distances = new List<float>() {
            base_len,
            base_len,
            base_len,
            base_len,
            base_len,
            base_len,
            base_len,
            base_len,
            base_len,
        };
        List<float> bend_points = new List<float>();
        float y_OS = Random.Range(0f, 0.5f);
        List<Vector3> directions = new List<Vector3>() {
            new Vector3(0f, y_OS, -1f).normalized
        };
        List<Vector2> size_OSs = new List<Vector2>() {
            new Vector2(box_width * 0.5f, box_height * 0.5f),
            new Vector2(box_width * 0.7f, box_height * 0.75f),
            new Vector2(box_width * 0.7f, box_height * 0.8f),
            new Vector2(box_width * 0.65f, box_height * 0.7f),
            new Vector2(box_width * 0.6f, box_height * 0.6f),
            new Vector2(box_width * 0.5f, box_height * 0.55f),
            new Vector2(box_width * 0.5f, box_height * 0.5f),
            new Vector2(box_width * 0.45f, box_height * 0.4f),
            new Vector2(box_width * 0.4f, box_height * 0.4f),
            new Vector2(box_width * 0.3f, box_height * 0.3f)
        };
        head_state = new cState(init_pos, distances, bend_points, directions, size_OSs);
        float mouthlen = base_len * 0.9f;
        distances = new List<float>() {
            mouthlen,
            mouthlen,
            mouthlen,
            mouthlen,
            mouthlen,
            mouthlen,
            mouthlen,
            mouthlen,
            mouthlen,
        };
        bend_points = new List<float>();
        directions = new List<Vector3>() {
            new Vector3(0f, y_OS - Random.Range(0.1f, 0.2f), -1f).normalized
        };
        float base_width = box_width * 0.7f;
        float base_height = box_height * 0.35f;
        size_OSs = new List<Vector2>() {
            new Vector2(base_width * 0.5f, base_height * 1.1f),
            new Vector2(base_width * 0.7f, base_height * 0.9f),
            new Vector2(base_width * 0.7f, base_height * 0.8f),
            new Vector2(base_width * 0.6f, base_height * 0.8f),
            new Vector2(base_width * 0.6f, base_height * 0.6f),
            new Vector2(base_width * 0.5f, base_height * 0.55f),
            new Vector2(base_width * 0.5f, base_height * 0.5f),
            new Vector2(base_width * 0.45f, base_height * 0.4f),
            new Vector2(base_width * 0.45f, base_height * 0.4f),
            new Vector2(base_width * 0.3f, base_height * 0.3f)
        };
        mouth_state = new cState(mouth_init_pos, distances, bend_points, directions, size_OSs);
    }

    public GameObject build(bodyB torso_builder)
    {
        head_obj = new GameObject();
        head_obj.name = "head";
        initState(torso_builder);
        buildMesh();
        MeshFilter mesh_filter = (MeshFilter)head_obj.AddComponent(typeof(MeshFilter));
        MeshRenderer mesh_renderer = (MeshRenderer)head_obj.AddComponent(typeof(MeshRenderer));
        mesh_filter.mesh = head_mesh.mesh;
        head_obj.GetComponent<MeshRenderer>().material = new Material(Shader.Find("Diffuse"));
        Texture2D texture = Utils.makeTexture(head_mesh.mesh.vertices, "head", torso_builder.colors);
        Renderer renderer = head_obj.GetComponent<Renderer>();
        renderer.material.mainTexture = texture;
        GameObject mouth_obj = new GameObject();
        mouth_obj.name = "mouth";
        mesh_filter = (MeshFilter)mouth_obj.AddComponent(typeof(MeshFilter));
        mesh_renderer = (MeshRenderer)mouth_obj.AddComponent(typeof(MeshRenderer));
        mesh_filter.mesh = mouth_mesh.mesh;
        mouth_obj.transform.parent = head_obj.transform;
        mouth_obj.GetComponent<MeshRenderer>().material = new Material(Shader.Find("Diffuse"));
        texture = Utils.makeTexture(mouth_mesh.mesh.vertices, "head", torso_builder.colors);
        renderer = mouth_obj.GetComponent<Renderer>();
        renderer.material.mainTexture = texture;
        float eye_scale = len * 0.05f;
        int eye_c = 5;
        Vector2 size_OS = head_state.getSizeOS(0.5f);
        Vector3 eye_pos = head_state.cs[eye_c] + new Vector3(-size_OS.x * 0.5f, size_OS.y * 1.5f, 0f);
        Vector3 right_OS = new Vector3(size_OS.x, 0f, 0f);
        Utils.drawSphere(head_obj.transform, eye_pos, Color.black, eye_scale);
        Utils.drawSphere(head_obj.transform, eye_pos + right_OS, Color.black, eye_scale);
        return head_obj;
    }

    public void init0State()
    {
        float base_len = box_len * Random.Range(0.72f, 0.92f);
        List<float> distances = new List<float>() {
            base_len,
            base_len,
            base_len,
            base_len,
            base_len,
            base_len,
            base_len,
            base_len,
            base_len,
        };
        List<float> bend_points = new List<float>();
        float y_OS = Random.Range(0f, 0.5f);
        List<Vector3> directions = new List<Vector3>() {
            new Vector3(0f, y_OS, -1f).normalized
        };
        float base_width = box_width;
        float base_height = box_height;
        List<Vector2> size_OSs = new List<Vector2>() {
            new Vector2(base_width * 0.4f, base_height * 0.5f),
            new Vector2(base_width * 0.65f, base_height * 0.5f),
            new Vector2(base_width * 0.6f, base_height * 0.6f),
            new Vector2(base_width * 0.6f, base_height * 0.65f),
            new Vector2(base_width * 0.65f, base_height * 0.6f),
            new Vector2(base_width * 0.65f, base_height * 0.6f),
            new Vector2(base_width * 0.5f, base_height * 0.45f),
            new Vector2(base_width * 0.45f, base_height * 0.35f),
            new Vector2(base_width * 0.3f, base_height * 0.35f),
            new Vector2(base_width * 0.2f, base_height * 0.35f)
        };
        head_state = new cState(init_pos, distances, bend_points, directions, size_OSs);
        float mouthlen = base_len * 0.83f;
        distances = new List<float>() {
            mouthlen,
            mouthlen,
            mouthlen,
            mouthlen,
            mouthlen,
            mouthlen,
            mouthlen,
            mouthlen,
            mouthlen,
        };
        bend_points = new List<float>();
        directions = new List<Vector3>() {
            new Vector3(0f, y_OS - Random.Range(0.1f, 0.2f), -1f).normalized
        };
        base_width = box_width * 0.7f;
        base_height = box_height * 0.32f;
        List<Vector2> mouth_size_OSs = new List<Vector2>() {
            new Vector2(base_width * 0.43f, base_height * 0.5f),
            new Vector2(base_width * 0.6f, base_height * 0.5f),
            new Vector2(base_width * 0.65f, base_height * 0.63f),
            new Vector2(base_width * 0.6f, base_height * 0.6f),
            new Vector2(base_width * 0.6f, base_height * 0.66f),
            new Vector2(base_width * 0.64f, base_height * 0.62f),
            new Vector2(base_width * 0.5f, base_height * 0.4f),
            new Vector2(base_width * 0.45f, base_height * 0.35f),
            new Vector2(base_width * 0.3f, base_height * 0.35f),
            new Vector2(base_width * 0.2f, base_height * 0.35f)
        };
        mouth_state = new cState(mouth_init_pos, distances, bend_points, directions, mouth_size_OSs);
    }

    public void init1State()
    {
        float base_len = box_len * Random.Range(0.62f, 0.73f);
        List<float> distances = new List<float>() {
            base_len,
            base_len,
            base_len,
            base_len,
            base_len,
            base_len,
            base_len,
            base_len,
            base_len,
        };
        List<float> bend_points = new List<float>();
        float y_OS = Random.Range(0f, 0.5f);
        List<Vector3> directions = new List<Vector3>() {
            new Vector3(0f, y_OS, -1f).normalized
        };
        float base_width = box_width;
        float base_height = box_height;
        List<Vector2> size_OSs = new List<Vector2>() {
            new Vector2(base_width * 0.43f, base_height * 0.4f),
            new Vector2(base_width * 0.5f, base_height * 0.57f),
            new Vector2(base_width * 0.64f, base_height * 0.66f),
            new Vector2(base_width * 0.6f, base_height * 0.6f),
            new Vector2(base_width * 0.64f, base_height * 0.56f),
            new Vector2(base_width * 0.6f, base_height * 0.6f),
            new Vector2(base_width * 0.52f, base_height * 0.54f),
            new Vector2(base_width * 0.42f, base_height * 0.4f),
            new Vector2(base_width * 0.31f, base_height * 0.31f),
            new Vector2(base_width * 0.2f, base_height * 0.2f)
        };
        head_state = new cState(init_pos, distances, bend_points, directions, size_OSs);
        float mouthlen = base_len * 0.75f;
        distances = new List<float>() {
            mouthlen,
            mouthlen,
            mouthlen,
            mouthlen,
            mouthlen,
            mouthlen,
            mouthlen,
            mouthlen,
            mouthlen,
        };
        bend_points = new List<float>();
        directions = new List<Vector3>() {
            new Vector3(0f, y_OS - Random.Range(0.1f, 0.2f), -1f).normalized
        };
        base_width = box_width * 0.76f;
        base_height = box_height * 0.31f;
        List<Vector2> mouth_size_OSs = new List<Vector2>() {
            new Vector2(base_width * 0.43f, base_height * 0.4f),
            new Vector2(base_width * 0.5f, base_height * 0.53f),
            new Vector2(base_width * 0.64f, base_height * 0.61f),
            new Vector2(base_width * 0.64f, base_height * 0.6f),
            new Vector2(base_width * 0.62f, base_height * 0.62f),
            new Vector2(base_width * 0.6f, base_height * 0.6f),
            new Vector2(base_width * 0.52f, base_height * 0.53f),
            new Vector2(base_width * 0.4f, base_height * 0.4f),
            new Vector2(base_width * 0.31f, base_height * 0.35f),
            new Vector2(base_width * 0.2f, base_height * 0.2f)
        };
        mouth_state = new cState(mouth_init_pos, distances, bend_points, directions, mouth_size_OSs);
    }

    public void buildMesh()
    {
        head_mesh = new CMesh();
        mouth_mesh = new CMesh();
        float current_c;
        for (int i = 0; i < c_count; i++)
        {
            current_c = i / (float)c_count;
            head_state.addc();
            mouth_state.addc();
            addVertices(current_c, head_state, head_mesh, true);
            addVertices(current_c, mouth_state, mouth_mesh, false);
            addUvs(head_mesh.uvs, current_c);
            addUvs(mouth_mesh.uvs, current_c);
            addTriangles(i, head_mesh);
            addTriangles(i, mouth_mesh);
            head_state.updatepos(current_c);
            mouth_state.updatepos(current_c);
        }
        head_mesh.mesh.vertices = head_mesh.geo_table.ToArray();
        head_mesh.mesh.uv = head_mesh.uvs.ToArray();
        head_mesh.mesh.triangles = head_mesh.triangle_table.ToArray();
        head_mesh.mesh.RecalculateNormals();
        mouth_mesh.mesh.vertices = mouth_mesh.geo_table.ToArray();
        mouth_mesh.mesh.uv = mouth_mesh.uvs.ToArray();
        mouth_mesh.mesh.triangles = mouth_mesh.triangle_table.ToArray();
        mouth_mesh.mesh.RecalculateNormals();
        LoopSubdivision.setParam(head_mesh);
        LoopSubdivision.subdivide(2);
        LoopSubdivision.setParam(mouth_mesh);
        LoopSubdivision.subdivide(2);
    }

    public void addVertices(float current_c, cState c_state, CMesh c_mesh, bool isHead)
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

        if (isHead)
        {
            c_mesh.geo_table.Add(c_pos + (normal * -width_OS) + (binormal * height_OS * 2f));
            c_mesh.geo_table.Add(c_pos + (normal * width_OS) + (binormal * height_OS * 2f));
            c_mesh.geo_table.Add(c_pos + (normal * width_OS));
            c_mesh.geo_table.Add(c_pos + (normal * -width_OS));
        }
        else
        {
            c_mesh.geo_table.Add(c_pos + (normal * -width_OS));
            c_mesh.geo_table.Add(c_pos + (normal * width_OS));
            c_mesh.geo_table.Add(c_pos + (normal * width_OS) - (binormal * height_OS * 2f));
            c_mesh.geo_table.Add(c_pos + (normal * -width_OS) - (binormal * height_OS * 2f));
        }
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
