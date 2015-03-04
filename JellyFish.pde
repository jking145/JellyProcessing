//Jellyfish Class
//Jellyfish constructed from multiple tentacles and a head.

class JellyFish {
  //The jellyfish tracks orign, velocity, and acceleration.
  PVector origin;
  PVector velocity;
  PVector acceleration;

  //The jellyfish's maximum speed, mass, size.
  float topspeed;
  float mass;
  float jellySize=48;

  //Arraylist to hold the tentacle arrays.
  ArrayList<Tentacle> tentacles;

  //Number of tentacles.
  int tentacleAmount = 7;

  //Constructor.
  JellyFish() {
    //Default start of the jellyfish, to be changed.
    origin = new PVector(width/2, height/2);
    //PVectors store the velocity  and acceleration values.
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);

    //Topspeed of the jellyfish.
    topspeed = 5;

    //Mass of the jellyfish.
    mass = 1;

    //Stores the tentacles of the jellyfish.
    tentacles = new ArrayList<Tentacle>();

    //Builds tentacles.
    buildTentacles();
  }

  //Attracts the jellyfish to the mouse.
  PVector getMouseAttractionForce(float mx, float my)
  {
    //Computes a vector that points from orign to mouse.
    PVector mouse = new PVector(mx, my);

    //Computes the strength of the force.
    PVector strength = PVector.sub(mouse, origin);

    //Normalizes the strength vector.
    strength.normalize();

    //Scales the strength vector.
    strength.mult(0.3);
    return strength;
  }

  //Draws the jellyfish to the screen.
  void display() {
    //Draws each tentacle.
    for (Tentacle jelly : tentacles) {
      jelly.drawTentacle();
      jelly.update();
    }
    //Draws jellyfish head.
    jelly.buildHead();
  }

  //Update jellyfish.
  void update() {
    //Velocity changes according to acceleration.
    velocity.add(acceleration);

    //Limits the velocity by topspeed.
    velocity.limit(topspeed);

    //Location changes by velocity.
    origin.add(velocity);

    //Resets the acceleration.
    acceleration.mult(0);
  }

  //Builds the tentacles of the jellyfish.
  void buildTentacles() {  
    for (int i=0; i<tentacleAmount; i++) {
      tentacles.add(new Tentacle());
    }
  }

  //Builds the head of the jellyfish.
  void buildHead() {
    fill(219, 177, 255);    
    arc(origin.x, origin.y, jellySize/2, jellySize/2, PI-HALF_PI, TWO_PI-HALF_PI, OPEN);
  }

  //Applies the attraction force from the current and/or the mouse.
  void applyForce(PVector force) {
    PVector newForce = PVector.div(force, mass);
    acceleration.add(newForce);
  }

  //Get origin.
  PVector getOrigin() {
    return origin.get();
  }

  //Get jellyfish size.
  float getJellySize() {
    return jellySize;
  }
}

