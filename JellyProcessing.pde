Wave wave;
Current current;
Mover mover;

float mx;
float my;

void setup() {
  size(1280, 720);
  frameRate(60);
  background(2, 15, 120);

  wave = new Wave(new PVector(0, 100), width, 40, 220);
  current = new Current();
  mover = new Mover();
}


void draw() {
  background(2, 15, 120);

  wave.calculate();
  wave.display();

  current.display();
  current.update();

  mover.display();
  mover.update();
}


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

