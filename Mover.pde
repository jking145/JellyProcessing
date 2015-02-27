// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Mover {

  // The Mover tracks orign, velocity, and acceleration 
  PVector origin;
  PVector velocity;
  PVector acceleration;
  // The Mover's maximum speed
  float topspeed;
  float mass;

  Mover() {
    // Start in the center
    origin = new PVector(width/2, height/2);
    velocity = new PVector(1, 0);
    //acceleration = new PVector(0,0);
    topspeed = 5;
    mass = 10;
  }

  void update() {

    // Compute a vector that points from orign to mouse
    PVector mouse = new PVector(mx, my);
    PVector acceleration = PVector.sub(mouse, origin);
    acceleration.normalize();
    acceleration.mult(0.2);

    // Velocity changes according to acceleration
    velocity.add(acceleration);
    // Limit the velocity by topspeed
    velocity.limit(topspeed);
    // Location changes by velocity
    origin.add(velocity);
    //acceleration.mult(0);
  }

  void display() {
    stroke(0);
    strokeWeight(2);
    fill(127);
    ellipse(origin.x, origin.y, 48, 48);
  }

  void applyForce(PVector force) {
    PVector newForce = PVector.div(force, mass);
    acceleration.add(newForce);
  }
}

