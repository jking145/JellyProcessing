/**
 * Title: JellyProcessing
 * Name: Julie King, Michel Didier
 * Date: 03/03/2015
 * Description: The project is a breeding environment of jellyfish. 
 * Unfortunately, life is tough, even for a jellyfish. Beginning with one single jellyfish in the state of an ephyra (call it a baby jellyfish), 
 * you will be able to move it around to get food and make it grow. The environment in which the jellyfish is developing will respond and get tougher 
 * through time depending on the size of the jellyfish, with random events happening such as currents, pollution.... Etc. 
 * The main point is to grow a colony, which you will be able to do by encountering other jellyfishes, randomly, and fertilize an egg. 
 * As the egg develop, you will have to protect it by the force of attractions. If you succeed, you will add one member to your colony. 
 * Keep this new baby alive, it will grow learning from your actions and maybe find another jellyfish and create some more eggs to fertilize!
 */

//Variables store instances.
Wave wave;
ParticleSystemCurrent current;
ParticleJelly jelly;

//Main setup.
void setup() {
  size(1280, 720);
  frameRate(60);
  background(2, 15, 80);

  //Instantiates environment.
  wave = new Wave(new PVector(0, 100), width, 10, 50);
 current = new ParticleSystemCurrent(new PVector(-width, height/2), new PVector (0,0));
 jelly = new ParticleJelly(new PVector(width/2, height/2), new PVector(0, 0), new PVector(0, 0), 48);
}

//Main draw.
void draw() {
  //Refreshes the background.
  background(2, 15, 80);

//    if (current.isOnScreen()) {
//      wave.update();
//   }

  wave.calculate();
  wave.display();

 current.display();
 current.applyForces();
 current.update();

 jelly.display();
 jelly.update();

  //Stores the node that the jellyfish is touching.
  ParticleNode collidingNode = current.isInCurrent(jelly);

  //Applies forces on the jelly only if the current is on screen and in contact with jellyfish.
  if (collidingNode!=null && current.isOnScreen()) {

    //Applies the attraction force between the jelly and the colliding node.
    PVector attractForceWithCollidingNode = collidingNode.attract(jelly);
    jelly.applyForce(attractForceWithCollidingNode);
  } else {
    //Applies the mouse tracking as a force.
    PVector mForce = jelly.getMouseAttractionForce(mouseX, mouseY);
    jelly.applyForce(mForce);
  }
}

