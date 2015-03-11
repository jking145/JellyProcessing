//Creation of ParticleSquare which is a subclass of class Particle.
class ParticlePlankton extends Particle {

  //Constructor.
  ParticlePlankton(PVector location_, PVector velocity_, float mass_) {
    //Call the parent constructor.
    super( location_, velocity_, mass_);
  }

  //Update and add forces.
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    // acceleration.mult(0);
    lifespan -= LIFESPAN_DECREMENT;
  }

  //Draw particles to the screen
  void display() {
    //super.display();
    stroke(0, 222, 141, lifespan);
    strokeWeight(1);
    ellipse(location.x, location.y, 3, 3);
  }
}

