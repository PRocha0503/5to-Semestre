using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class Score : MonoBehaviour
{
    public Text ScoreText;
    float points;
    // Start is called before the first frame update
    void Start()
    {
        ScoreText.text = "Score: 0";
    }

    void setScore(float _s){
        ScoreText.text = $"Score: {_s}";
    }

    // Update is called once per frame
    void Update()
    {
        //Change the score
        points = Chiken.getPoints();
        setScore(points);

    }
}
