//Creation of class Particle.
class Particle {  
  final float MASS_TO_SIZE_FACTOR = 10;
  final float LIFESPAN_INIT_VALUE = 255;
  final float LIFESPAN_DECREMENT = 1.0f;

  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  float mass;

  //Constructor for class Particle.
  Particle(PVector location_, PVector velocity_, PVector acceleration_, float mass_) {
    acceleration = new PVector(0, 0);
    velocity = velocity_.get();
    location = location_.get();
    lifespan = LIFESPAN_INIT_VALUE;
    mass = mass_;
  }

  void run() {
    update();
    display();
  }

  //Apply force.
  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);   
    acceleration.add(f);
  }

  //Update forces.
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    lifespan -= LIFESPAN_DECREMENT;
  }

  //Draw to the screen.
  void display() {
    stroke(0, lifespan);
    strokeWeight(2);
    fill(127, lifespan);
    ellipse(location.x, location.y, getSize(), getSize());
  }

  //Returns the size (in pixels) of the particle.
  int getSize() {
    return round(mass*MASS_TO_SIZE_FACTOR);
  }

  //If particle is no longer useful kill the particle.
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}

