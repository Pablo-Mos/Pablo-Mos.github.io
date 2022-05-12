using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;

public class Branch {
    public List<Bud> buds = new List<Bud>();
    public int ord;
    public Tree tree;

    public Branch(Tree new_tree, Vector3 init_pos, Vector3 init_tan, int new_ord) {
        Bud init_bud = new Bud(init_pos, init_tan, true, true);
        init_bud.dim = 1;
        buds.Add(init_bud);
        ord = new_ord;
        tree = new_tree;
    }

    public void makeNewBuds(Bud bud, List<Bud> new_buds) {
        bud.apical = false;
        Bud prev_bud = bud;
        Bud new_bud;
        Vector3 new_dir, new_pos, new_tan, inter_offset;
        int new_buds_num = newGrowthBuds(bud);

        float x_offset, z_offset;
        for (int i = 0; i < new_buds_num; i++) {
            inter_offset = growthInterOffset(prev_bud);
            if (ord == 1) {
                x_offset = Random.Range(0.04f, 0.1f);
                z_offset = Random.Range(0.04f, 0.1f);
                new_dir = new Vector3(x_offset, 1f, z_offset).normalized;
            } else {
                new_dir = (prev_bud.tan + inter_offset).normalized;
            }
            new_pos = prev_bud.pos + (growthInterLen(prev_bud) * new_dir);
            if (new_pos.y <= 1) {
                new_pos.y = 1;
            }
            new_tan = new_dir;
            new_bud = new Bud(new_pos, new_tan);
            new_bud.age = prev_bud.age + 1;
            new_bud.dim = prev_bud.dim + 1;
            new_buds.Add(new_bud);
            prev_bud = new_bud;
        }
        new_buds[new_buds.Count - 1].apical = true;
    }

    public float growthInterLen(Bud bud) {
        return tree.inter_length;
    }

    public float growthRadius(int dim) {
        float radius = tree.inter_radius * ord;
        radius *=  0.1f * (1f / dim);
        radius *= 2f;
        return radius;
    }

    public int newGrowthBuds(Bud bud) {
        return Mathf.CeilToInt(tree.inters_per_growth * (1f / (ord * 0.7f))); //
    }

    public Vector3 growthInterOffset(Bud bud) {
        Vector3 tan = bud.tan;
        Vector3 normal = Vector3.Cross(tan, Vector3.right).normalized;
        Vector3 binormal = Vector3.Cross(tan, normal).normalized;
        Vector3 offset = Vector3.up * tree.orthotropic;
        offset += new Vector3(bud.tan.x, 0f, bud.tan.z) * tree.plagiotropic;
        offset += normal * Random.Range(-.9f, .7f) * tree.wiggle;
        offset += binormal * Random.Range(-.6f, .9f) * tree.wiggle;
        return offset;
    }

    public void makeNewAxBud(Bud bud, List<Branch> new_branches) {
        bud.ax = true;
        float num_of_branches = (float) Random.Range(tree.min_buds_per_node, 4);
        Vector3 tan = bud.tan;
        Vector3 normal = Vector3.Cross(tan, Vector3.right).normalized;
        Vector3 binormal = Vector3.Cross(tan, normal).normalized;
        Vector3 init_pos = bud.pos;
        Vector3 new_vertex;
        Vector3 init_tan;
        Branch new_branch;
        float init_theta = Random.Range(0f, 2f*Mathf.PI);
        for (float theta = init_theta; theta < 2f*Mathf.PI + init_theta; theta += ((2f*Mathf.PI) / num_of_branches)) {
            new_vertex = ((normal * Mathf.Cos(theta)) + (binormal * Mathf.Sin(theta))) * growthRadius(bud.dim);
            init_tan = new_vertex.normalized;
            new_branch = new Branch(tree, init_pos + new_vertex, init_tan, ord + 1);
            new_branch.buds[0].age = bud.age + 1;
            new_branches.Add(new_branch);
        }

    }
    public void grow(List<Branch> new_branches) {
        Bud bud;
        List<Bud> new_buds = new List<Bud>();
        float rndVal;
        for (int b = 0; b < buds.Count; b++) {
            bud = buds[b];
            rndVal = Random.value;
            if (bud.valid()) {
                if (deathProb(bud)) {
                    bud.alive = false;
                } 
                if (!bud.init && ramProb(bud)) {
                    makeNewAxBud(bud, new_branches);
                }
                if (bud.apical) {
                    makeNewBuds(bud, new_buds);
                }
            } else if (tree.ram_type == "palm" && bud.apical && ord == 1 && !bud.alive) {
                makeNewAxBud(bud, new_branches);
            }
        }
        if (new_buds.Count > 0) {
            buds.AddRange(new_buds);
        }
    }

    public bool deathProb(Bud bud) {
        float dim_effect;
        dim_effect = bud.dim * 0.2f;
        if (Random.value > tree.death_prob + dim_effect || bud.age < 28) {
            if (ord > 1 && tree.plagiotropic < 0.5f && bud.dim > 5) {
                return true;
            }
            return false;
        }
        return true;
    }

    public bool ramProb(Bud bud) {
        switch (tree.ram_type) {
            case "palm":
                return false;
            case "continuous":
                if (ord == 1 && bud.dim >= tree.min_dim_1) {
                    return true;
                } else if (ord != 1 && bud.dim >= tree.min_dim) {
                    return true;
                }
                return false;
            case "diffuse":
                if (ord == 1 && bud.dim >= tree.min_dim_1) {
                    float rndVal = Random.value;
                    return rndVal > 0.1f;
                } else if (ord != 1 && bud.dim >= tree.min_dim) {
                    float rndVal = Random.value;
                    return rndVal > 0.1f;
                }
                break;
            case "rhythmic":
                if (ord == 1 && bud.dim >= tree.min_dim_1) {
                    if (bud.dim % 2 == 0) {
                        return true;
                    }
                } else if (ord != 1 && bud.dim >= tree.min_dim) {
                    if (bud.dim % 2 == 0) {
                        return true;
                    }
                }
                return false;
        }
        return false;
    }
}
