using System.Collections;
using System.Collections.Generic;
using UnityEngine;

// Main character
public class Chiken : MonoBehaviour
{
        //Where the character starts
        float x = -11;
        float y = 0;
        //Points and lives
        [SerializeField] public static float points = 1;
        [SerializeField] int lives = 3;

        

    // Start is called before the first frame update
    void Start()
    {
        //Start in that position
        transform.position = new Vector3(x,y,0);
    }
    // Update is called once per frame
    void Update()
    {
        //Check for keys and move accordingly
        if (Input.GetKeyDown("up") && y<3) {
            y += 0.5f;
            transform.position = new Vector3(x, y, 0);
        }
        if (Input.GetKeyDown("down") && y>-3) {
            y += -0.5f;
            transform.position = new Vector3(x, y, 0);
        }
        if (Input.GetKeyDown("right")) {
            points ++;
            x += 1.0f;
            transform.position = new Vector3(x, y, 0);
        }
        if (Input.GetKeyDown("left") && x>-11) {
            points --;
            x -= 1.0f;
            transform.position = new Vector3(x, y, 0);
        }
        if(x>12.5){
            x = -11;
            transform.position = new Vector3(-11, y, 0);
        }
        //destroy if no lives left
        if(lives < 1){
            Destroy(gameObject);
        }
    }

    void OnCollisionEnter2D(Collision2D col){
        //Decresase lives if collision with enemy
        if (col.gameObject.tag == "mc"){
        lives --;
        }
    }

    public static float getPoints(){
        return points;
    }
}
