using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

//Screen Script
public class Enemy : MonoBehaviour
{
    //Enemy object
    [SerializeField] GameObject enemy;
    //Range for enemy to apper
    [SerializeField] Vector3 offset;
    //Random number generator
    float rn;
    //Main character position
    Transform playerPos;
    float points;
    // Start is called before the first frame update
    void Start()
    {
        //Makes an enemy every 1 second
        InvokeRepeating("MakeEnemy",1,1);
        //Player position
        playerPos = GameObject.FindWithTag("Player").transform;

        points = Chiken.getPoints();
        
    }

    // Update is called once per frame
    void Update()
    {

    }

    //Method to create new enemy
    void MakeEnemy(){
        //Random number for character to apper
        rn = Random.Range(-20,20);
        //Where the new enempy will appper
        Instantiate(enemy,new Vector3(playerPos.position.x + (offset.x*rn), 6, 0),Quaternion.identity);
    }
}
