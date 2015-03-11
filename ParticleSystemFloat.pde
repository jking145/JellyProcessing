//Creation of class ParticleSystemFloat which is a subclass of class ParticleSystem.
class ParticleSystemFloat extends ParticleSystem {
  
  //Get the particle origin.
  ParticleSystemFloat(PVector origin_) {
    super(origin_);
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
    return new ParticleAirBubbles(origin, PVector.random2D(), 1);
  }
}
