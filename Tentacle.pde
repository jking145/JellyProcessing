//A tentacle object
//Made from sine waves of multiple ellipses

class Tentacle {
  //Arraylist to hold the tentacle arrays.
  //ArrayList<Tentacle> tentacle;

  //Arrays to control tentacle generation. 
  float[] dist = new float[3];
  float[] amp = new float[3];

  //Scalar to control speed of tentacle movement.
  float speed = 0;

  //Tentacle length.
  float tLength;

  //Size of ellipses that make up the tentacles.
  float tSize;

  //Opacity.
  int alpha;

  Tentacle() {
    for (int i=0; i<3; i++) {
      //Distance between each ellipse.
      dist[i] = random(0.005, 0.1);

      //Amplitude of the wave.
      amp[i] = random(2, 30);
    }

    //Adding a general cosine wave on the length of the tentacle, 
    float scale = cos(HALF_PI)+1;

    //Tentacle length with small degree of randomness between each tentacle.
    tLength = width/2*random(0.1, 0.3)*scale;

    //Opacity (may change in the future).
    alpha = int(random(40, 60));
  }

  void drawTentacle() {
    //Tentacle starting point. 
    float tentacleOriginX; 
    float tentacleOriginY;
    tentacleOriginX = 0;
    pushMatrix();

    //Position of the jellyfish.
    translate(jelly.origin.x, jelly.origin.y);

    //Draws each ellipse in the tentacle.
    while (tentacleOriginX < tLength) {

      //Maps the size of each ellipse to be decreasing.
      float radius = map(tentacleOriginX, 0, tLength, 15, 1);

      //Maps the amplitude of the wave depending on the length of the tentacle.
      float ampMap = map(tentacleOriginX, 0, tLength, 0, 1);

      //Distance is multiplied by the origin point of the tentacle. Speed is added. Multiplied by the amplitude to increase the height of the wave.
      //tentacleOriginY = sin(dist[0]*tentacleOriginX+speed)*amp[0] + sin(dist[1]*tentacleOriginX+speed)*amp[1] + sin(dist[2]*tentacleOriginX+speed)*amp[2];
      
      tentacleOriginY = 0;
      for (int i=0; i<dist.length; i++) {
        tentacleOriginY+=sin(dist[i]*tentacleOriginX+speed)*amp[i];
      }
      
      //Once the sine wave is generated the mapped amplitude value is applied.
      tentacleOriginY = tentacleOriginY*ampMap;

      //Aesthetic details.
      strokeWeight(1);
      stroke(219, 177, 255, alpha);
      noFill();

      //Ellipses that make up the tentacles.
      ellipse(tentacleOriginX, tentacleOriginY, radius, radius);

      //Determines the size of the ellipses making up the tentacles. 
      if (radius>10)
        tSize = radius/3;
      tentacleOriginX += tSize;
    }
    popMatrix();
  }

  void update() {
    //Slow down speed of tentacle movemnt.
    speed -= 0.06;
  }
}

