//Variables which store the objects instances
Wave wave;
Current current;
Mover mover;

//MOD
Node largestNode;

//Variables which store the mouse coordinates
float mx;
float my;

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
  largestNode.fillColor = color(255,0,0);
  
  mover = new Mover();
  
}

//DRAW
void draw() {
  //Refresh the background
  background(2, 15, 120);

  //Apply functions on each objects
  wave.calculate();
  wave.display();
  
  //MOD
  current.checkBounds();
  current.display();
  current.applyForces();
  current.update();

  //MOD
  PVector attractForceWithLargestNode = largestNode.attract(mover);
  //Apply the force
  mover.applyForce(attractForceWithLargestNode);
  //Applying the mouse tracking as a force (for now)
  PVector mForce = mover.getMouseAttractionForce(mouseX,mouseY);
  mover.applyForce(mForce);
  
  mover.display();
  mover.update();
  
}

//Mouse controls of the jelly
//Have to change the method, not good practice
void mouseReleased() {

}

void getMouseX() {
  mx = mouseX;
  println(mx);
}

void getMouseY() {
  my = mouseY;
  println(my);
}

