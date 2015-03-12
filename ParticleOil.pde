//Creation of ParticleOilSpill which is a subclass of class Particle.
class ParticleOil extends Particle {

  //Constructor.
  ParticleOil(PVector location_, PVector velocity_, PVector acceleration_, float mass_) {
    //Call the parent constructor.
    super(location_, velocity_, acceleration_, mass_);
  }

  //Update and add forces.
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    //acceleration.mult(0);
    lifespan -= LIFESPAN_DECREMENT;
  }

  //Draw particles to the screen.
  void display() {
    //super.display();
    stroke(0, lifespan);
    strokeWeight(0.5);
    fill(0);
    ellipse(location.x, location.y, 5, 5);
  }
}

