using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GenerateTree : MonoBehaviour {
    public GameObject makeTree(int seed, Vector3 pos) {
        GameObject tree_object = new GameObject();
        Leaf leaf = (Leaf) GetComponent<Leaf>();
        Mesh leaf_mesh = leaf.makeMesh();
        Texture2D leaf_texture = leaf.makeTexture();
        Tree tree = tree_object.AddComponent<Tree>();
        tree.setParameters(seed, tree_object, leaf_mesh, leaf_texture);
        tree.makeBranches();
        tree.renderBranches();
        tree_object.transform.position = pos;
        return tree_object;
    }
}
