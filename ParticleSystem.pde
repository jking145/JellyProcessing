//Creation of class ParticleSystem.
class ParticleSystem {
  //Arraylist for all the particles.
  ArrayList<Particle> particles;

  //Origin point for where particles are birthed.
  PVector location;
  
  //TESTING TO SEE IF THIS FIXES THE CODE
  PVector velocity;

  //Current iteration.
  int iteration;

  ParticleSystem(PVector location_, PVector velocity_) {  
    //Initialize the arraylist.
    particles = new ArrayList<Particle>();

    //Store the origin point.
    location = location_.get();
    velocity = velocity_.get();
  }

  //Method to update and apply forces to the particles. 
  void run() {
    applyForces();
    for (int i = particles.size ()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();

      //Remove dead particles.
      if (p.isDead()) {
        particles.remove(i);
      }
    }

    //Iterates through the array.
    iteration++;
  }

  //Add particles.
  void addParticle() {
    particles.add(createParticle());
  }

  //Creates and returns a new particle.
  Particle createParticle() {
    float x = random(0, 1);
    if ( x < 0.33) {
      return new ParticlePlankton(location, velocity, PVector.random2D(), 1);
    } else if (x < 0.66) { 
      return new ParticleAirBubbles(location, velocity, PVector.random2D(), 1);
    } else {
      return new ParticleOil(location, velocity, PVector.random2D(), 1);
    }
  }

  //Apply forces.
  void applyForces() {
  }
}

