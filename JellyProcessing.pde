//Variables which store the objects instances
Wave wave;
Current current;
JellyFish jelly;

//MOD
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

  //MOD
  largestNode = current.getLargestNodeInCurrent();
  largestNode.fillColor = color(255, 0, 0);

  jelly = new JellyFish();
}

//DRAW
void draw() {
  //Refresh the background
  background(2, 15, 120);

  //Apply functions on each objects
  wave.calculate();
  wave.display();

  //MOD
  //current.checkBounds();
  current.display();
  current.applyForces();
  current.update();

  if (current.isOnScreen()) {
    PVector attractForceWithLargestNode = largestNode.attract(jelly);
    //Apply the force
    jelly.applyForce(attractForceWithLargestNode);
  }
  
  //MOD

  //Applying the mouse tracking as a force (for now)
  PVector mForce = jelly.getMouseAttractionForce(mouseX, mouseY);
  jelly.applyForce(mForce);
  jelly.display();
  jelly.update();
}

