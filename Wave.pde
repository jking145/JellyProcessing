// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com
// Tweaked by Michel Didier

class Wave {

  int xspacing = 1; // How far apart should each horizontal location be spaced
  int w;            // Width of entire wave

  PVector location;          // Where does the wave's first point start
  float theta = 0.0;       // Start angle at 0
  float amplitude;         // Height of wave
  float period;            // How many pixels before the wave repeats
  float dx;                // Value for incrementing X, to be calculated as a function of period and xspacing
  float[] yvalues;         // Using an array to store height values for the wave (not entirely necessary)

  Wave(PVector l, int w_, float a, float p) {
    location = l.get();
    w = w_;
    period = p;
    amplitude = a;
    dx = (TWO_PI / period) * xspacing;
    yvalues = new float[w/xspacing];
  }


  void calculate() {
    // Increment theta (try different values for 'angular velocity' here
    theta += 0.02;

    // For every x value, calculate a y value with sine function
    float x = theta;
    for (int i = 0; i < yvalues.length; i++) {
      yvalues[i] = sin(x)*amplitude;
      x+=dx;
    }
  }

  void display() {
    // A simple way to draw the wave with a line at each location
    for (int x = 0; x < yvalues.length; x++) {
      noStroke();
      fill(255);
      rect(location.x+x*xspacing, location.y+yvalues[x], 1, 1);
    }
  }

  //THIS IS SO SILLY it's ridiculous. Let's just keep it in there for a good laugh.
//  void update() {
//    location.y+=random(-10,10);
//  }
}

