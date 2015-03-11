//Creation of ParticleAirBubbles which is a subclass of class Particle.
class ParticleAirBubbles extends Particle {

  //Constructor.
  ParticleAirBubbles(PVector location_, PVector velocity_, float mass_) {
    //Call the parent constructor.
    super( location_, velocity_, mass_);
  }

  //Update and add forces.
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.div(10);
    lifespan -= LIFESPAN_DECREMENT;
  }

  //Draw particles to the screen
  void display() {
    //super.display();
    stroke(133, 219, 255, lifespan*2);
    strokeWeight(1);
    float bubbleSize=random(10);
    ellipse(location.x, location.y, bubbleSize, bubbleSize);
  }
}

