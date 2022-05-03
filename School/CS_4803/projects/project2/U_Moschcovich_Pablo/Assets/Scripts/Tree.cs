using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Tree : MonoBehaviour {
    public float min_dim;
    int growthCycles;
    public int seedTree;
    public List<Branch> branches;
    public float plagiotropic;
    public float orthotropic;
    public float inter_radius;
    public float inter_length;
    public float pause_prob;
    public float death_prob;
    public float ram_prob;
    public float min_dim_1;
    public float conical;
    public GameObject parent_obj;
    public float wiggle;
    public Mesh leaf_mesh;
    public Texture2D leaf_texture;
    public int inters_per_growth;
    public string[] ram_types = { "continuous", "rhythmic", "diffuse", "palm" };
    public string ram_type;
    public string[] phyll_types = { "distic", "spiral" };
    public string phyll_type;
    public int max_ord;
    public int min_buds_per_node;
     public int index;
    public Color current_color;

    Color[] color_sets = {
        new Color(.5f, .2f, .05f, 1f),
        new Color(.65f, .25f, .02f, 1f),
        new Color(.6f, .2f, .1f, 1f),
        new Color(.45f, .1f, .08f, 1f),
        new Color(.37f, .05f, 0f, 1f),
        new Color(.44f, .19f, .1f, 1f),
    };

    public void setParameters(int seed, GameObject new_parent_obj, Mesh new_leaf_mesh, Texture2D new_leaf_texture) {
        seedTree = seed;
        Random.InitState(seedTree);

        plagiotropic = Random.Range(0.4f, 1.2f);
        if (Random.value > 0.5f) 
            orthotropic = Random.Range(-1f, -0.1f);
        else
            orthotropic =  Random.Range(0.1f, 1f);
        inter_radius = Random.Range(0.05f, 0.15f);
        max_ord = Random.Range(6, 9);
        min_buds_per_node = Random.Range(1, 2);
        pause_prob = Random.Range(0.1f, 0.2f);
        death_prob = Random.Range(0.05f, 0.2f);
        ram_prob = Random.Range(0.2f, 0.3f);
        growthCycles = Random.Range(3, 5);
        min_dim_1 = Random.Range(1, 9);
        inter_length = Random.Range(0.5f, 1.5f);
        inters_per_growth = Random.Range(1, 5);
        ram_type = ram_types[Random.Range(0, 3)];
        phyll_type = phyll_types[Random.Range(0, 1)];
        min_dim = Random.Range(2, 5);
        conical = Random.Range(0.05f, 0.1f);
        Branch init_branch = new Branch(this, new Vector3(0, 0, 0), new Vector3(0.1f * plagiotropic, 1, 0.1f * plagiotropic).normalized, 1);
        init_branch.buds[0].age = 1;
        branches = new List<Branch>();
        branches.Add(init_branch);
        parent_obj = new_parent_obj;
        index = Random.Range(0, color_sets.Length);
        current_color = color_sets[index];
        wiggle = Random.Range(0.25f, 0.75f);
        leaf_mesh = new_leaf_mesh;
        leaf_texture = new_leaf_texture;
    }

    public void makeBranches() {
        List<Branch> new_branches;
        growthCycles = 7;
        for (int g = 0; g < growthCycles; g++) {
            new_branches = new List<Branch>();
            for (int b = 0; b < branches.Count; b++) {
                branches[b].grow(new_branches);
            }
            if (new_branches.Count > 0) {
                branches.AddRange(new_branches);
            }
        }
        List<Branch> empty_branches = new List<Branch>();
        for (int b = 0; b < branches.Count; b++) {
            if (branches[b].buds.Count == 1) {
                empty_branches.Add(branches[b]);
            }
        }
        for (int b = 0; b < empty_branches.Count; b++) {
            branches.Remove(empty_branches[b]);
        }
    }

    public void renderBranches() {
        Branch branch;
        GameObject branch_obj;
        for (int b = 0; b < branches.Count; b++) {
            branch = branches[b];
            branch_obj = new GameObject();
            MeshFilter mesh_filter = (MeshFilter) branch_obj.AddComponent<MeshFilter>();
            MeshRenderer mesh_renderer = (MeshRenderer) branch_obj.AddComponent<MeshRenderer>();
            mesh_renderer.material = new Material(Shader.Find("Diffuse"));
            Renderer renderer = branch_obj.GetComponent<Renderer>();
            Mesh branch_mesh = makeBranchMesh(branch);
            mesh_filter.mesh = branch_mesh;
            Texture2D branch_texture = makeBranchTexture(branch, branch_mesh);
            renderer.material.mainTexture = branch_texture;
            branch_obj.transform.parent = parent_obj.transform;
        }
    }

    public Mesh makeBranchMesh(Branch branch) {
        Mesh branch_mesh = new Mesh();
        int column = 0;
        int row = 0;
        Bud current_bud;
        Bud next_bud;
        Vector3 point_on_inter;
        List<Vector3> vertices = new List<Vector3>();
        List<Vector2> uv = new List<Vector2>();
        List<int> tris = new List<int>();
        int vertex_index = 0;
        float theta = 0;
        float radius = 0;
        float y_step_size = 0.2f;
        int circle_step_size = 15;
        Vector3 apical_bud_pos = branch.buds[branch.buds.Count - 1].pos;
        for (int b = 0; b < branch.buds.Count - 1; b++) {
            current_bud = branch.buds[b];
            next_bud = branch.buds[b + 1];
            if (next_bud.apical) {
                y_step_size *= 0.5f;
            }
            for (float t = 0; t < 1; t += y_step_size) {
                point_on_inter = degree1Bezier(t, current_bud.pos, next_bud.pos);
                column = 0;
                radius = growthRadius(Vector3.Distance(apical_bud_pos, point_on_inter));
                for (theta = 0; theta < 2f*Mathf.PI; theta += 2f*Mathf.PI / circle_step_size) {
                    vertices.Add(point_on_inter + getVertexOffset(theta, current_bud.tan, radius, branch.ord));
                    uv.Add(new Vector2(column / (circle_step_size + 1), row));
                    vertex_index++;
                    column++;
                }
                row++;
            }
            if (branch.ord >= 2 && !current_bud.ax && !current_bud.apical && !current_bud.init) {
                GameObject leaf_obj = new GameObject();
                MeshFilter mesh_filter = (MeshFilter) leaf_obj.AddComponent<MeshFilter>();
                MeshRenderer mesh_renderer = (MeshRenderer) leaf_obj.AddComponent<MeshRenderer>();
                mesh_renderer.material = new Material(Shader.Find("Diffuse"));
                leaf_obj.transform.position = current_bud.pos + leafOffset(current_bud, radius);
                leaf_obj.transform.parent = parent_obj.transform;
                Renderer renderer = leaf_obj.GetComponent<Renderer>();
                mesh_filter.mesh = leaf_mesh;
                renderer.material.mainTexture = leaf_texture;
            }
        }
        vertices.Add(apical_bud_pos);
        uv.Add(new Vector2(1.0f, 1.0f));
        for (int i = 0; i < uv.Count; i++) {
            uv[i] = new Vector2(uv[i].x, uv[i].y / (row - 1));
        }
        for (int v = 0; v < vertices.Count - 1; v++) {
            if (v >= vertices.Count - circle_step_size - 1) {
                if ((v + 1) % circle_step_size == 0) {
                    tris.Add(v);
                    tris.Add(v - circle_step_size + 1);
                    tris.Add(vertices.Count - 1);
                } else {
                    tris.Add(v);
                    tris.Add(v + 1);
                    tris.Add(vertices.Count - 1);
                }
            } else if ((v + 1) % circle_step_size == 0) {
                tris.Add(v);
                tris.Add(v - circle_step_size + 1);
                tris.Add(v + circle_step_size);
                tris.Add(v - circle_step_size + 1);
                tris.Add(v + 1);
                tris.Add(v + circle_step_size);
            } else {
                tris.Add(v);
                tris.Add(v + 1);
                tris.Add(v + circle_step_size);
                tris.Add(v + 1);
                tris.Add(v + 1 + circle_step_size);
                tris.Add(v + circle_step_size);
            }
        }
        branch_mesh.vertices = vertices.ToArray();
        branch_mesh.triangles = tris.ToArray();
        branch_mesh.uv = uv.ToArray();
        branch_mesh.RecalculateNormals();
        return branch_mesh;
    }

    public Vector3 leafOffset(Bud bud, float radius) {
        float theta = Random.Range(0f, 2f*Mathf.PI);
        Vector3 tan = bud.tan;
        Vector3 normal = Vector3.Cross(tan, Vector3.right).normalized;
        Vector3 binormal = Vector3.Cross(tan, normal).normalized;
        Vector3 offset = ((normal * Mathf.Cos(theta)) + (binormal * Mathf.Sin(theta))) * radius;
        return offset;
    }

    public Vector3 getVertexOffset(float theta, Vector3 tan, float radius, int ord) {
        Vector3 normal;
        if (tan.Equals(Vector3.up) || tan.Equals(Vector3.down)) {
            normal = Vector3.Cross(tan, Vector3.right).normalized;
        } else {
            normal = Vector3.Cross(tan, Vector3.down).normalized;
        }
        Vector3 binormal = Vector3.Cross(tan, normal).normalized;
        return ((normal * Mathf.Cos(theta)) + (binormal * Mathf.Sin(theta))) * radius;
    }

    public float growthRadius(float distance_to_apical) {
        float radius = inter_radius ;
        radius *= conical * distance_to_apical;
        radius *= 2f;
        return radius;
    }

    public Vector3 degree1Bezier(float t, Vector3 point1, Vector3 point2) {
        return ((1 - t) * point1) + (t * point2);
    }

    public Texture2D makeBranchTexture(Branch branch, Mesh branch_mesh) {
        Vector3[] vertices = branch_mesh.vertices;
        Texture2D texture = new Texture2D (Mathf.FloorToInt(Mathf.Pow(vertices.Length, 0.5f)), Mathf.FloorToInt(Mathf.Pow(vertices.Length, 0.5f)));
        Color[] colors = new Color[vertices.Length];
        for (int c = 0; c < colors.Length; c++) {
            colors[c] = current_color;
        }
        texture.wrapMode = TextureWrapMode.Clamp;
        texture.SetPixels(colors);
        texture.Apply();
        return texture;
    }
}
