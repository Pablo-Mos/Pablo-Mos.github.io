using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Bud {
    public bool init;
    public bool hasLeaf = false;
    public bool alive = true;
    public int age;
     public Vector3 pos;
    public Vector3 tan;
    public bool apical;
    public bool ax = false;
    public int dim;
    public Bud(Vector3 new_pos, Vector3 new_tan, bool new_apical = false, bool new_init = false) {
        init = new_init;
        pos = new_pos;
        tan = new_tan;
        apical = new_apical;
    }
    public bool valid() {
        return !ax && alive;
    }

}
