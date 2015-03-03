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

//Variables which store the objects instances
Wave wave;
Current current;
JellyFish jelly;

//SETUP
void setup() {
  //Make the sketch 1280 by 720
  size(1280, 720);
  //Force the frameRate to 60
  frameRate(60);
  //Background color
  background(2, 15, 80);

  //Create new objects
  wave = new Wave(new PVector(0, 100), width, 10, 50);
  current = new Current();

  //Create a new jelly
  jelly = new JellyFish();
}

//DRAW
void draw() {
  //Refresh the background
  background(2, 15, 80);

  //Wave functions
  wave.calculate();
  wave.display();
//  if (current.isOnScreen()) {
//    wave.update();
//  }

  //Current functions
  current.display();
  current.applyForces();
  current.update();
  
  //Jellyfish functions
  jelly.display();
  jelly.update();
  
  //Stores the node that the jellyfish is touching
  Node collidingNode = current.isInCurrent(jelly);
  //Applies the forces on the jelly only if the current is on screen
  //And if the jelly is touching a node
  if (collidingNode!=null && current.isOnScreen()) {
    //Applies the attraction force between the jelly and the colliding node
    PVector attractForceWithCollidingNode = collidingNode.attract(jelly);
    jelly.applyForce(attractForceWithCollidingNode);
  } else {
    //Applies the mouse tracking as a force (for now)
    PVector mForce = jelly.getMouseAttractionForce(mouseX, mouseY);
    jelly.applyForce(mForce);
  }
}

