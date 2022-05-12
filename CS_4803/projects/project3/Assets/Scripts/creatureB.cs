using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class creatureB
{
    int seed;
    GameObject parent_object;
    Dictionary<string, GameObject> components;
    bodyB torso_builder = new bodyB();
    legsB limb_builder = new legsB();
    headB head_builder = new headB();
    tailB tail_builder = new tailB();

    public void setParam(int _seed, GameObject _parent_object)
    {
        parent_object = _parent_object;
        seed = _seed;
        components = new Dictionary<string, GameObject>();
        Random.InitState(seed);
    }

    public void build()
    {
        components.Add("torso", torso_builder.build());
        components.Add("tail", tail_builder.build(torso_builder));
        components.Add("limbs", limb_builder.build(torso_builder));
        components.Add("head", head_builder.build(torso_builder));
        foreach (KeyValuePair<string, GameObject> pair in components)
        {
            pair.Value.transform.parent = parent_object.transform;
        }
    }
}
