//Jellyfish object
//A jellyfish object that is built from multiple tentacles and a head

class JellyFish {

  // The jellyfish tracks orign, velocity, and acceleration 
  PVector origin;
  PVector velocity;
  PVector acceleration;
  // The jellyfish's maximum speed, mass, size
  float topspeed;
  float mass;
  float jellySize=48;

  //Arraylist to hold the tentacle arrays.
  ArrayList<Tentacle> tentacles;

  //Number of tentacles.
  int tentacleAmount = 7;

  //Constructor
  JellyFish() {
    //Default start of the jelly, to be changed
    origin = new PVector(width/2, height/2);
    //PVector which store the velocity values of a node
    velocity = new PVector(0, 0);
     //PVector which store the acceleration values of a node
    acceleration = new PVector(0, 0);
    //Topspeed of the jelly
    topspeed = 5;
    //Mass of the jelly
    mass = 1;
    //Stores the tentacles of the jelly
    tentacles = new ArrayList<Tentacle>();
    //Function which build the tentacles
    buildTentacles();
  }
  
  //PVector that attract the jelly to the mouse
  PVector getMouseAttractionForce(float mx, float my)
  {
    //Compute a vector that points from orign to mouse
    PVector mouse = new PVector(mx, my);
    //Compute the strength of the force
    PVector strength = PVector.sub(mouse, origin);
    //Normalize the strength vector
    strength.normalize();
    //Scaling the strength vector
    strength.mult(0.3);
    return strength;
  }

  //Draw the jelly to the screen
  void display() {
    //Draw each tentacles
    for (Tentacle jelly : tentacles) {
      jelly.drawTentacle();
      jelly.update();
    }
    //Draw the head of the jelly
    jelly.buildHead();
  }

  void update() {
    // Velocity changes according to acceleration
    velocity.add(acceleration);
    // Limit the velocity by topspeed
    velocity.limit(topspeed);
    // Location changes by velocity
    origin.add(velocity);
    //Reset the acceleration
    acceleration.mult(0);
  }

  //Build the tentacles of the jellyfish.
  void buildTentacles() {  
    for (int i=0; i<tentacleAmount; i++) {
      tentacles.add(new Tentacle() );
    }
  }

  //Builds the head of the jellyfish.
  void buildHead() {
    fill(219, 177, 255);    
    arc(origin.x, origin.y, jellySize/2, jellySize/2, PI-HALF_PI, TWO_PI-HALF_PI, OPEN);
  }
  
  //Apply the attraction force from the current and/or the mouse
  void applyForce(PVector force) {
    PVector newForce = PVector.div(force, mass);
    acceleration.add(newForce);
  }
}

