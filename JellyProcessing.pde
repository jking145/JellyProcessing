//Variables which store the objects instances
Wave wave;
Current current;
JellyFish jelly;

//Stores the largest node instance
//For now, the jellyfish is only attracted by the largest one...
Node largestNode;

//SETUP
void setup() {
  //Make the sketch 1280 by 720
  size(1280, 720);
  //Force the frameRate to 60
  frameRate(60);
  //Background color
  background(2, 15, 120);

  //Create new objects
  wave = new Wave(new PVector(0, 100), width, 40, 220);
  current = new Current();

  //Stores the largest node index
  largestNode = current.getLargestNodeInCurrent();
  //Apply a red fill to the largest node
  largestNode.fillColor = color(255, 0, 0);
  
  //Create a new jelly
  jelly = new JellyFish();
}

//DRAW
void draw() {
  //Refresh the background
  background(2, 15, 120);

  //Wave functions
  wave.calculate();
  wave.display();

  //Current functions
  current.display();
  current.applyForces();
  current.update();

  //Applies the forces on the jelly only if the current is on screen
  //to fix/add: && current.isInCurrent()
  if (current.isOnScreen()) {
    PVector attractForceWithLargestNode = largestNode.attract(jelly);
    //Apply the force
    jelly.applyForce(attractForceWithLargestNode);
    println("Working");
  }

  //Applies the mouse tracking as a force (for now)
  PVector mForce = jelly.getMouseAttractionForce(mouseX, mouseY);
  
  //Jellyfish functions
  jelly.applyForce(mForce);
  jelly.display();
  jelly.update();
}

