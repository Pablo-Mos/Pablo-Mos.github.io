using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public static class Utils
{
    public static Color calcTailColor(List<Color> colors, Vector3 vertex)
    {
        if (Random.value < 0.1f)
        {
            return colors[Random.Range(1, colors.Count - 1)];
        }
        Color color = colors[0] * Random.Range(0.8f, 1.2f);
        color.a = 1;
        return color;
    }

    public static Color calcLimbColor(List<Color> colors, Vector3 vertex)
    {
        if (Random.value < 0.1f)
        {
            return colors[Random.Range(1, colors.Count - 1)];
        }
        Color color = colors[0] * Random.Range(0.75f, 1.25f);
        color.a = 1;
        return color;
    }

    public static Color calcTorsoColor(List<Color> colors, Vector3 vertex)
    {
        if (Random.value < 0.1f)
        {
            return colors[Random.Range(1, colors.Count - 1)];
        }
        Color color = colors[0] * Random.Range(0.75f, 1.25f);
        color.a = 1;
        return color;
    }

    public static Color calcHeadColor(List<Color> colors, Vector3 vertex)
    {
        if (Random.value < 0.1f)
        {
            return colors[Random.Range(1, colors.Count - 1)];
        }
        Color color = colors[0] * Random.Range(0.8f, 1.2f);
        color.a = 1;
        return color;
    }

    public static void drawSphere(Transform parent, Vector3 pos, Color color, float scale)
    {
        GameObject sphere = GameObject.CreatePrimitive(PrimitiveType.Sphere);
        sphere.transform.localScale *= scale;
        sphere.transform.position = pos;
        sphere.transform.parent = parent;
        Renderer renderer = sphere.GetComponent<Renderer>();
        renderer.material.color = color;
    }

    public static float weightedRange(float[] w_range)
    {
        List<float> return_values = new List<float>();
        for (int i = 0; i < w_range.Length - 2; i += 3)
        {
            for (int j = 0; j < w_range[i + 2]; j++)
            {
                return_values.Add(Random.Range(w_range[i], w_range[i + 1]));
            }
        }
        return return_values[Random.Range(0, return_values.Count)];
    }
    public static Texture2D makeTexture(Vector3[] vertices, string component_type, List<Color> _colors)
    {
        int texture_length = Mathf.FloorToInt(Mathf.Sqrt(vertices.Length));
        Texture2D texture = new Texture2D(texture_length, texture_length);
        Color[] colors = new Color[vertices.Length];
        Vector3 vertex = new Vector3();
        int index = 0;
        Color color;
        for (int z = 0; z < texture_length; z++)
        {
            for (int x = 0; x < texture_length; x++)
            {
                index = z * texture_length + x;
                vertex = vertices[index];
                color = Color.red;
                switch (component_type)
                {
                    case "limbs":
                        color = calcLimbColor(_colors, vertex);
                        break;
                    case "torso":
                        color = calcTorsoColor(_colors, vertex);
                        break;
                    case "head":
                        color = calcHeadColor(_colors, vertex);
                        break;
                    case "claws":
                        color = calcClawColor(_colors, vertex);
                        break;
                    case "tail":
                        color = calcTailColor(_colors, vertex);
                        break;
                }
                colors[index] = color;
            }
        }
        texture.wrapMode = TextureWrapMode.Clamp;
        texture.SetPixels(colors);
        texture.Apply();
        return texture;
    }

    public static Color getBaseColor()
    {
        int color_type = Random.Range(0, 5);
        Color color = new Color(0 / 255f, 0 / 255f, 0 / 255f);
        if (color_type == 0)
        {
            color = Color.green;
            color.a = 1;
        }
        else if (color_type == 1)
        {
            color = Color.red;
            color.a = 1;
        }
        else if (color_type == 2)
        {
            color = Color.blue;
            color.a = 1;
        }
        else if (color_type == 3)
        {
            color = Color.yellow;
            color.a = 1;
        }
        else if (color_type == 4)
        {
            color = Color.cyan;
            color.a = 1;
        }
        return color;
    }

    public static Color getHighlightColor()
    {
        int color_type = Random.Range(0, 6);
        Color color = new Color(0 / 255f, 0 / 255f, 0 / 255f);

        if (color_type == 0)
        {
            color = Color.cyan;
        }
        else if (color_type == 1)
        {
            color = Color.red;
            color.a = 1;
        }
        else if (color_type == 2)
        {
            color = Color.blue;
            color.a = 1;
        }
        else if (color_type == 3)
        {
            color = Color.yellow;
            color.a = 1;
        }
        else if (color_type == 4)
        {
            color = Color.white;
        }
        return color;
    }

    public static Color calcClawColor(List<Color> colors, Vector3 vertex)
    {
        if (Random.value < 0.1f)
        {
            return colors[Random.Range(1, colors.Count - 1)];
        }
        Color color = colors[0] * Random.Range(0.8f, 1.2f);
        color.a = 1;
        return color;
    }
}
