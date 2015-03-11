//Creation of class ParticleSystemFloat which is a subclass of class ParticleSystem.
class ParticleSystemJellies extends ParticleSystem {
  
  //Get the particle origin.
  ParticleSystemJellies(PVector origin_) {
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
    return new ParticleJelly(origin, PVector.random2D(), 1);
  }
}
