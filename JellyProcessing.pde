Wave wave;
Current current;

void setup() {
  size(1280, 720);
  frameRate(60);
  background(2,15,120);
  
  wave = new Wave(new PVector(0,100),width,40,220);
  current = new Current();
  
}


void draw() {
  background(2,15,120);
  
  wave.calculate();
  wave.display();
  
  current.display();
  current.update();
 
  
}


