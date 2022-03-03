using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Mc : MonoBehaviour
{
    //Initial heigth
    float y = 6;
    [SerializeField] Vector3 start;
    float rn;
    //Main chracter points
    float points;

    // Start is called before the first frame update
    void Start()
    {
        //Make character go to start and get main character points
        start = transform.position;
        points = Chiken.getPoints();
        rn = Random.Range(0,2);
        //See if it will go up or down
        if(rn == 0){
            
            transform.position = new Vector3(start.x, y, 0);
        }else{
            y=-6;
             transform.position = new Vector3(start.x, y, 0);
        }
        ;
    }

    // Update is called once per frame
    void Update()
    {
        //make it go up or down
        if(rn == 0){
            y -= 0.02f *(points/10);
        }else{

             y += 0.02f *(points/10);
        }
         transform.position = new Vector3(start.x, y, 0);

        //Destroy if out of the map
        if(y>7 || y<-7){
            Destroy(gameObject);
        }
    }
}
