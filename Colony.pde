//A class to control the jellyfish colony/life cycle.

class Colony { 
  ArrayList<ParticleJelly> jelly;

  //Origin point for where particles are birthed.
  PVector location;
  DNA dna;
  float health;
  float maxspeed;
  float jellySize;

  //Constructor.
  Colony (PVector location_, DNA dna_) {
    //Instantiates new colony of jellyfish.
    jelly = new ArrayList<ParticleJelly>();

    //Store the origin point.
    location = location_.get();
    health = 200;
    dna = dna_;
    maxspeed = map(dna.genes[0], 0, 1, 15, 0);
    jellySize = map(dna.genes[0], 0, 1, 0, 50);
  }

  void run() {
    update();
    borders();
    display();
  }

  Colony reproduce() {
    if (random(1) < 0.0005) {
      DNA childDNA = dna.copy();
      childDNA.mutate(0.01);
      return new Colony(location, childDNA);
    } else {
      return null;
    }
  }

  void update() {
    PVector velocity = new PVector(); 

    location.add(velocity);
    health -= 0.2;
  }

  // Wraparound to make sure that the jelly stays onscreen
  void borders() {
    if (location.x < -jellySize) location.x = width+jellySize;
    if (location.y < -jellySize) location.y = height+jellySize;
    if (location.x > width+jellySize) location.x = -jellySize;
    if (location.y > height+jellySize) location.y = -jellySize;
  }

  void display() {
   //
  }

  // Death
  boolean dead() {
    if (health < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}

