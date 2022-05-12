using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class cState
{
    public List<float> bend_points;
    public List<Vector3> directions;
    public List<Vector3> normals;
    public List<Vector3> cs = new List<Vector3>();
    public Vector3 pos;
    public List<float> distances;
    public List<Vector3> binormals;
    public List<Vector2> size_OSs;

    public void addc()
    {
        cs.Add(pos);
    }

    public Vector3 getBinormal(float curr_c)
    {
        for (int i = 0; i < bend_points.Count; i++)
        {
            if (curr_c < bend_points[i])
            {
                return binormals[i];
            }
        }
        return binormals[binormals.Count - 1];
    }

    public cState(Vector3 _pos, List<float> _distances, List<float> _bend_points, List<Vector3> _directions, List<Vector2> _size_OSs)
    {
        pos = _pos;
        distances = _distances;
        bend_points = _bend_points;
        directions = _directions;
        size_OSs = _size_OSs;
        normals = new List<Vector3>();
        binormals = new List<Vector3>();
        Vector3 direction, normal, binormal;
        for (int i = 0; i < directions.Count; i++)
        {
            direction = directions[i];
            if (direction.Equals(Vector3.up) || direction.Equals(Vector3.down))
            {
                normal = Vector3.Cross(direction, Vector3.right).normalized;
            }
            else
            {
                normal = Vector3.Cross(direction, Vector3.down).normalized;
            }
            binormal = Vector3.Cross(direction, normal).normalized;
            normals.Add(normal);
            binormals.Add(binormal);
        }
    }

    public Vector3 getDirection(float curr_c)
    {
        for (int i = 0; i < bend_points.Count; i++)
        {
            if (curr_c < bend_points[i])
            {
                return directions[i];
            }
        }
        return directions[directions.Count - 1];
    }

    public float getDistance(float curr_c)
    {
        return distances[Mathf.RoundToInt(curr_c * distances.Count)];
    }

    public Vector3 getNormal(float curr_c)
    {
        for (int i = 0; i < bend_points.Count; i++)
        {
            if (curr_c < bend_points[i])
            {
                return normals[i];
            }
        }
        return normals[normals.Count - 1];
    }

    public Vector2 getSizeOS(float curr_c)
    {
        return size_OSs[Mathf.RoundToInt(curr_c * size_OSs.Count)];
    }

    public void updatepos(float curr_c)
    {
        pos += getDirection(curr_c) * getDistance(curr_c);
    }

    public float getInter(float curr_c)
    {
        return 0f;
        float next_bend = bend_points[bend_points.Count - 1];
        float past_bend = bend_points[Mathf.Max(bend_points.Count - 2, 0)];
        for (int i = 0; i < bend_points.Count; i++)
        {
            if (curr_c < bend_points[i])
            {
                next_bend = bend_points[i];
                past_bend = bend_points[Mathf.Max(0, i - 1)];
                break;
            }
        }
        float next_Inter = 1f - (next_bend - curr_c);
        float past_Inter = 1f - (curr_c - past_bend);
        if (next_bend < curr_c)
        {
            return 0f;
        }
        return next_Inter - (0.25f * past_Inter);
    }

    public Vector3 getNextNormal(float curr_c)
    {
        for (int i = 0; i < bend_points.Count; i++)
        {
            if (curr_c < bend_points[i])
            {
                return normals[Mathf.Min(i + 1, normals.Count - 1)];
            }
        }
        return normals[normals.Count - 1];
    }

    public Vector3 getNextBinormal(float curr_c)
    {
        for (int i = 0; i < bend_points.Count; i++)
        {
            if (curr_c < bend_points[i])
            {
                return binormals[Mathf.Min(i + 1, binormals.Count - 1)];
            }
        }
        return binormals[binormals.Count - 1];
    }
}
