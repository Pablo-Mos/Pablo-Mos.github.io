using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class Main : MonoBehaviour {

    Camera mainCamera;
    public GenerateTerrain generateTerrain;
    public GenerateTree generateTree;
    public int seed = 4;
    GameObject middleTree;
    GameObject rightTree;
    GameObject leftTree;
    GameObject terrain;
    public InputField inputField;

    void Start() {
        var submitEvent = new InputField.SubmitEvent();
        submitEvent.AddListener(putSeed);
        inputField.onEndEdit = submitEvent;
        generateTerrain = GetComponent<GenerateTerrain>();
        generateTree = GetComponent<GenerateTree>();
        initCamera();
        terrain = generateTerrain.makeTerrain(mainCamera.transform.position);
        renderTrees();
    }

     void changeSeed(int newSeed) {
        seed = newSeed;
        destroyTrees();
        renderTrees();
    }

    void destroyTrees() {
        Destroy(middleTree);
        Destroy(leftTree);
        Destroy(rightTree);
    }

    void initCamera() {
        mainCamera = Camera.main;
        mainCamera.transform.position += new Vector3(0, 8, 0);
    }

    void putSeed(string text) {
        int newSeed;
        bool success = int.TryParse(text, out newSeed);
        if (success) {
            changeSeed(newSeed);
        }
    }

    void renderTrees() {
        leftTree = generateTree.makeTree(seed + 1, mainCamera.transform.position + new Vector3(-14, -5, 25));
        leftTree.name = "leftTree";
        rightTree = generateTree.makeTree(seed + 2, mainCamera.transform.position + new Vector3(14, -5, 25));
        rightTree.name = "rightTree";
        middleTree = generateTree.makeTree(seed, mainCamera.transform.position + new Vector3(0, -6, 25));
        middleTree.name = "middleTree";
    }
}
