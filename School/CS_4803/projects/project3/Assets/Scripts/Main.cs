using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class Main : MonoBehaviour
{
    Camera mainCamera;
    public creatureB creature_builder = new creatureB();
    public int seed = 32;
    int creature_max = 5;
    GameObject[] creatures;
    Vector3[] poss;
    public InputField inputField;

    GameObject newCreature(int seed, Vector3 pos)
    {
        GameObject creature_object = new GameObject();
        creature_builder.setParam(seed, creature_object);
        creature_builder.build();
        creature_object.transform.position = pos;
        return creature_object;
    }

    void Start()
    {
        var submitEvent = new InputField.SubmitEvent();
        submitEvent.AddListener(enterSeed);
        inputField.onEndEdit = submitEvent;
        initializeCamera();
        int zOS = 20;
        poss = new Vector3[] {
            new Vector3(-3, 2f, zOS),
            new Vector3(4, 2f, zOS),
            new Vector3(-6, -3, zOS),
            new Vector3(1, -3, zOS),
            new Vector3(8, -3, zOS),
        };
        creatures = new GameObject[creature_max];
        renderCreatures();
    }

    void initializeCamera()
    {
        mainCamera = Camera.main;
        mainCamera.transform.position += new Vector3(0, 5, 0);
    }

    void enterSeed(string text)
    {
        int newSeed;
        bool success = int.TryParse(text, out newSeed);
        if (success)
        {
            changeSeed(newSeed);
        }
    }

    void changeSeed(int newSeed)
    {
        seed = newSeed;
        destroyCreatures();
        renderCreatures();
    }

    void destroyCreatures()
    {
        for (int i = 0; i < creature_max; i++)
        {
            Destroy(creatures[i]);
        }
    }

    void renderCreatures()
    {
        for (int i = 0; i < creature_max; i++)
        {
            creatures[i] = newCreature(seed + i, mainCamera.transform.position + poss[i]);
            creatures[i].name = "creature_" + i;

        }
    }
}
