using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class Lives : MonoBehaviour
{

    public Text LivesText;
    float lives;
    // Start is called before the first frame update
    void Start()
    {
        LivesText.text = "Lives: 3";
    }

    // Update is called once per frame
    void Update()
    {
        //Change the score
        lives = Chiken.getLives();
        setLives(lives);   
    }

     void setLives(float _l){
        LivesText.text = $"Lives: {_l}";
    }
}
