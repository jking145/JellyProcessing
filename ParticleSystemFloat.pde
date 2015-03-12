//Creation of class ParticleSystemFloat which is a subclass of class ParticleSystem.
class ParticleSystemFloat extends ParticleSystem {
  
  //Get the particle origin.
  ParticleSystemFloat(PVector location_, PVector velocity_) {
    super(location_, velocity_);
  }

  //Apply float.
  void applyForces() {
    for (Particle p : particles) {
      PVector floatUp = new PVector(0,-0.1);      
      p.applyForce(floatUp);
    }
  }

  //Draw particles to the screen.
  Particle createParticle() {
    return new ParticleAirBubbles(location, PVector.random2D(), new PVector (0,0), 1);
  }
}
