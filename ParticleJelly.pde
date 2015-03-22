//Jellyfish Class
//Jellyfish constructed from multiple tentacles and a head.

class ParticleJelly extends Particle {
  //The jellyfish's maximum speed, mass, size.
  float jellySize=48;

  //Arraylist to hold the tentacle arrays.
  ArrayList<Tentacle> tentacles;

  //Number of tentacles.
  int tentacleAmount = 7;

  //STEERING IMPLEMENT
  float maxforce;
  float maxspeed;

  //G.A. implement?
  //  DNA dna;
  //  float health;
  //  float r;
  //  float maxspeed;

  //Constructor.
  ParticleJelly(PVector location_, PVector velocity_, PVector acceleration_, float mass_) {
    //Call the parent constructor.
    super(location_, velocity_, acceleration_, mass_);

    //Default start of the jellyfish, to be changed.
    //location = new PVector(width/2, height/2);
    //PVectors store the velocity  and acceleration values.
    //velocity = new PVector(0, 0);
    //acceleration = new PVector(0, 0);

    //G.A. implement?
    //    location = location_.get();
    //    health = 200;
    //    dna = dna_;
    //    //Gene 0 determines maxspeed and r
    //    //the bigger the jelly the slower it grows
    //    maxspeed = map(dna.genes[0], 0, 1, 15, 0);
    //    r = map(dna.genes[0], 0, 1, 0, 50);

    //Mass of the jellyfish.
    mass = 1;

    //Stores the tentacles of the jellyfish.
    tentacles = new ArrayList<Tentacle>();

    //Builds tentacles.
    buildTentacles();

    //STEERING IMPLEMENT
    maxspeed = 3;
    maxforce = 0.5;
  }

  //Attracts the jellyfish to the mouse.
  PVector getMouseAttractionForce(float mx, float my)
  {
    //Computes a vector that points from orign to mouse.
    PVector mouse = new PVector(mx, my);

    //Computes the strength of the force.
    PVector strength = PVector.sub(mouse, location);

    //Normalizes the strength vector.
    strength.normalize();

    //Scales the strength vector.
    strength.mult(0.3);
    return strength;
  }

  //Draws the jellyfish to the screen.
  void display() {
//    //Draws each tentacle.
//    for (Tentacle jelly : tentacles) {
//      jelly.drawTentacle();
//      jelly.update();
//    }
    //Draws jellyfish head.
    jelly.buildHead();
  }

  //Update jellyfish.
  void update() {
    //Velocity changes according to acceleration.
    velocity.add(acceleration);

    //Limits the velocity by topspeed.
    velocity.limit(maxspeed);

    //Location changes by velocity.
    location.add(velocity);

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
    float theta = velocity.heading2D() + PI;
    pushMatrix();
    translate(location.x, location.y);
    rotate(theta);
    
    //Draws each tentacle.
    for (Tentacle jelly : tentacles) {
      jelly.drawTentacle();
      jelly.update();
    }
    
    beginShape();
    fill(219, 177, 255);    
    arc(0, 0, jellySize/2, jellySize/2, PI-HALF_PI, TWO_PI-HALF_PI);
    endShape(CLOSE);
    popMatrix();
  }

  //Applies the attraction force from the current and/or the mouse.
  void applyForce(PVector force) {
    PVector newForce = PVector.div(force, mass);
    acceleration.add(newForce);
  }
  


  // A method that calculates a steering force towards a target
  // STEER = DESIRED MINUS VELOCITY
  void arrive(PVector target) {
  PVector desired = PVector.sub(target, location);  // A vector pointing from the location to the target
    float d = desired.mag();
    // Normalize desired and scale with arbitrary damping within 100 pixels
    desired.normalize();
    if (d < 200) {
      float m = map(d, 20, 150, 0, maxspeed);
      desired.mult(m);
    } else {
      desired.mult(maxspeed);
    }

    // Steering = Desired minus Velocity
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxforce);  // Limit to maximum steering force
    applyForce(steer);
  }

  //Get origin.
  PVector getLocation() {
    return location.get();
  }

  //Get jellyfish size.
  float getJellySize() {
    return jellySize;
  }

  //G.A. Implement?
  // At any moment there is a teeny, tiny chance a jellyfish will reproduce
  //  ParticleJelly reproduce() {
  //    // asexual reproduction
  //    if (random(1) < 0.0005) {
  //      // Child is exact copy of single parent
  //      DNA childDNA = dna.copy();
  //      // Child DNA can mutate
  //      childDNA.mutate(0.01);
  //      return new jelly(location, childDNA);
  //    } else {
  //      return null;
  //    }
  //  }
  //
  //  // Death
  //  boolean dead() {
  //    if (health < 0.0) {
  //      return true;
  //    } else {
  //      return false;
  //    }
  //  }
}

