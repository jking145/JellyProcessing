//Variables which store the objects instances
Wave wave;
Current current;
Mover mover;

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
  mover = new Mover();
  
}

//DRAW
void draw() {
  //Refresh the background
  background(2, 15, 120);

  //Apply functions on each objects
  wave.calculate();
  wave.display();

  current.display();
  current.update();

  mover.display();
  mover.update();
  
}

//Mouse controls of the jelly
//Have to change the method, not good practice
void mousePressed() {
  getMouseX();
  getMouseY();
}

void getMouseX() {
  mx = mouseX;
  println(mx);
}

void getMouseY() {
  my = mouseY;
  println(my);
}

