//Creation of class ParticleSystemSwarm which is a subclass of class ParticleSystem.
class ParticleSystemSwarm extends ParticleSystem {

  //Get the particle origin.
  ParticleSystemSwarm(PVector origin_) {
    super(origin_);
  }

  //Apply friction.
  void applyForces() {
    for (Particle p : particles) { 
      //Coefficient of friction.
      float c = random(0.0002, 0.002);  

      //Get a copy of the velocity vector.
      PVector friction= p.velocity.get();

      //Reverse the direction.
      friction.mult(-1);

      //Normalize the vector.
      friction.normalize();

      //Apply strength.
      friction.mult(c);    
      p.applyForce(friction);
    }
  }

  //Draw particles to the screen.
  Particle createParticle() {
    return new ParticlePlankton(origin, PVector.random2D(), 1);
  }
}

