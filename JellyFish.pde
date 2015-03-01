// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class JellyFish {

  // The Mover tracks orign, velocity, and acceleration 
  PVector origin;
  PVector velocity;
  PVector acceleration;
  // The Mover's maximum speed
  float topspeed;
  float mass;

  //Arraylist to hold the tentacle arrays.
  ArrayList<Tentacle> tentacles;

  //Number of tentacles.
  int count = 7;


  JellyFish() {
    // Start in the center
    origin = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    //acceleration = new PVector(0,0);
    topspeed = 5;
    //mass = 10;
    //sabine
    mass=1;

    tentacles = new ArrayList<Tentacle>();
    buildTentacles();
  }

  PVector getMouseAttractionForce(float mx, float my)
  {
    // Compute a vector that points from orign to mouse
    PVector mouse = new PVector(mx, my);
    PVector strength = PVector.sub(mouse, origin);
    strength.normalize();
    strength.mult(0.09);
    return strength;
  }

  void display() {
    for (Tentacle jelly : tentacles) {
      jelly.drawTentacle();
      jelly.update();
    }
  }

  void update() {
    // Velocity changes according to acceleration
    velocity.add(acceleration);
    // Limit the velocity by topspeed
    velocity.limit(topspeed);
    // Location changes by velocity
    origin.add(velocity);
    acceleration.mult(0);
  }

  void buildTentacles() {  
    for (int i=0; i<count; i++) {
      tentacles.add(new Tentacle() );
    }
  }

  void applyForce(PVector force) {
    PVector newForce = PVector.div(force, mass);
    acceleration.add(newForce);
  }

  void checkEdges()
  {
    if (origin.x>width||origin.x<0)
    {
      velocity.x*=-1;
    }
    if (origin.y>height||origin.y<0)
    {
      velocity.y*=-1;
    }
  }
}

