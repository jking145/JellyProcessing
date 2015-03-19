//Tentacle Class.
//Made from sine waves of multiple ellipses.
//Inspired from the code of http://www.openprocessing.org/sketch/126679

class Tentacle {
  //Arrays to control tentacle generation. 
  float[] dist = new float[3];
  float[] amp = new float[3];

  //Controls speed of tentacle movement.
  float speed = 0;

  //Tentacle length.
  float tLength;

  //Size of ellipses.
  float tSize;
  
 // float tRotate;

  //Opacity.
  int alpha;

  //Constructor.
  Tentacle() {
    for (int i=0; i<3; i++) {
      //Distance between each ellipse.
      dist[i] = random(0.005, 0.1);

      //Amplitude of the wave.
      amp[i] = random(2, 30);
    }
    
    //RE-ADDITION OF rotate function to the code
    //tRotate = HALF_PI;

    //Adds a general cosine wave.
    float scale = cos(HALF_PI)+1;

    //Determines tentacle length.
    tLength = width/2*random(0.1, 0.3)*scale;

    //Opacity (may change in the future).
    alpha = int(random(40, 60));
  }

  //Draws tentacles of the jellyfish.
  void drawTentacle() {
    //Tentacle starting point. 
    float tentacleLocationX; 
    float tentacleLocationY;
    tentacleLocationX = 0;
    pushMatrix();

    //Position.
    translate(0, 0);
  // rotate(tRotate);

    while (tentacleLocationX < tLength) {
      //Maps the size of each ellipse.
      float radius = map(tentacleLocationX, 0, tLength, 15, 1);

      //Maps the amplitude of the wave depending on tentacle length.
      float ampMap = map(tentacleLocationX, 0, tLength, 0, 1);

      //Distance is multiplied by the origin point of the tentacle. 
      //Speed is added. 
      //Multiplied by the amplitude to increase the height of the wave.
      //tentacleOriginY = sin(dist[0]*tentacleOriginX+speed)*amp[0] + sin(dist[1]*tentacleOriginX+speed)*amp[1] + sin(dist[2]*tentacleOriginX+speed)*amp[2];

      //Sofian edit.
      tentacleLocationY = 0;
      for (int i=0; i<dist.length; i++) {
        tentacleLocationY+=sin(dist[i]*tentacleLocationX+speed)*amp[i];
      }

      //Multiplies the sine wave by mapped amplitude.
      tentacleLocationY = tentacleLocationY*ampMap;

      //Aesthetic details.
      strokeWeight(1);
      stroke(219, 177, 255, alpha);
      noFill();
      ellipse(tentacleLocationX, tentacleLocationY, radius, radius);

      //Determines the size of the ellipses . 
      if (radius>10)
        tSize = radius/3;
      tentacleLocationX += tSize;
    }
    popMatrix();
  }

  //Slows down speed of tentacle movemnt.
  void update() {
    speed -= 0.06;
  }
}

