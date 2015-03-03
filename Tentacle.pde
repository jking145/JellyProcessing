class Tentacle {
  //Arraylist to hold the tentacle arrays.
  ArrayList<Tentacle> tentacle;

  //Arrays to hold the tentacles. 
  float[] a = new float[3];
  float[] b = new float[3];
  float[] c = new float[3];

  //Scalar to control speed of tentacle movement.
  float inc = 0;

  //Tentacle length
  float tLength;

  //Size of ellipses that make up the tentacles.
  float tSize;

  //Tentacle direction.
  float tRotate;

  //Opacity.
  int alpha;

  Tentacle() {
    //Assigning random lengths to the arrays (I think but may be wrong.....)
    for (int i=0; i<3; i++) {
      a[i] = random(0.005, 0.1);
      b[i] = random(0, HALF_PI);
      c[i] = random(2, 30);
    }

    //Assuring that the tentacles always point down.
    //tRotate = random(HALF_PI, -PI);

    //Scalar to determine length of the tentacles, tLength to add degree of randomness to length.
    float scale = cos(tRotate+HALF_PI)+1.8;
    tLength = width/4*random(0.1, 0.3)*scale;

    //Opacity.
    alpha = int(random(40, 60));
  }

  void drawTentacle() {
    float x, y;
    x = 0;
    pushMatrix();

    //Follow the mouse.
    translate(jelly.origin.x, jelly.origin.y);
    //rotate(tRotate);

    //While loop to keep drawing tentacles to the screen.
    while (x < tLength) {

      float r = map(x, 0, tLength, 15, 1);
      float A = map(x, 0, tLength, 0, 1);

      //Formula to generate the sine wave in the tentacle movement.
      y = sin(a[0]*x+b[0]+inc)*c[0] + sin(a[1]*x+b[1]+inc)*c[1] + sin(a[2]*x+b[2]+inc)*c[2];
      y = y*A;

      //Aesthetic details.
      strokeWeight(1);
      stroke(219, 177, 255, alpha);
      noFill();
      
      //Ellipses that make up the tentacles.
      ellipse(x, y, r, r);

      //Arc for the jellyfish head.
      {
        float h = r*1.4;
        float g = r*1.9;        
        arc(0, 0, g, g, PI-HALF_PI, TWO_PI-HALF_PI, OPEN);
      }

      //Determines the size of the ellipses making up the tentacles. 
      if (r>10)
        tSize = r/3;
      x += tSize;
    }
    popMatrix();
  }

  void update() {
    //Changes speed of tentacle movement back and forth.
    inc -= 0.06;
  }
}

