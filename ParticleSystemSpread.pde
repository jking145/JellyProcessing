//Creation of class ParticleSystemSpread which is a subclass of class ParticleSystem.
class ParticleSystemSpread extends ParticleSystem {

  //Get the particle origin.
  ParticleSystemSpread(PVector location_, PVector velocity_) {
    super(location_, velocity_);
  }

  //Apply gravity and friction.
  void applyForces() {
    for (Particle p : particles) {

      //Apply gravity.
      PVector gravity = new PVector(0, 0.001);      
      p.applyForce(gravity);

      //Apply friction formula.            
      //Coefficient of friction.
      float c = random(0.002, 0.002);  

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
    return new ParticleOil(location, PVector.random2D(), new PVector(0,0), 1);
  }
}

