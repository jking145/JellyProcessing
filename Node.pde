//Node object
//Those are the points of reference making a current

class Node {
  //PVector which store the location values of a node
  PVector origin;
  //PVector which store the acceleration values of a node
  PVector acceleration;
  //PVector which store the attraction values of a node
  PVector attraction;
  //PVector which store the velocity values of a node
  PVector velocity;

  //Variables which store different parameters related to a node
  float nodeSize;
  float mass;
  float gravity;
  color fillColor = 255;

  //Constructor
  Node(PVector origin_, float nodeSize_) {
    origin = origin_.get();
    nodeSize = nodeSize_;
    //For now, mass and gravity are set to 1 for beta-testing
    mass=1;
    gravity = 1;
    //Makes new velocity vector
    velocity = new PVector(0, 0);
    //Makes new acceleration vector
    acceleration = new PVector();
  }

  //PVector that attract the jelly to a node
  PVector attract(JellyFish jelly) {
    //Makes a new force resulting from the substraction between the node and the jelly
    PVector force = PVector.sub(origin, jelly.origin);
    //Stores the magnitude of the force as a distance
    float distance = force.mag();
    //Constrain the distance
    distance = constrain(distance, 5.0, 25.0);
    //Normalize the force
    force.normalize();
    //Strength of attraction calculation
    float strength = (gravity * ((nodeSize/2)*mass) * jelly.mass) / (distance * distance);
    //Multiply the nomarlized force by the strength
    force.mult(strength);
    return force;
  }


  //Display function of a node
  //Will be fully transparent later to hide the current
  void display() {
    ellipseMode(CENTER);
    fill(fillColor);
    ellipse(origin.x, origin.y, nodeSize, nodeSize);
  }

  //Apply the inputed force from current (waterPush)
  void applyForce(PVector forceIn) {
    PVector f = forceIn.get();
    f.div(mass);
    acceleration.add(f);
  }

  //Update function of a node
  void update() {
    //Applies the acceleration to the velocity
    velocity.add(acceleration);
    //Limit the velocity
    velocity.limit(5);
    //Add the velocity to the origin
    origin.add(velocity);
    //Reset the acceleration
    acceleration.mult(0);
  }

  //Getter which return the nodeSize
  //Use this method to calculate the size of the current
  float getNodeSize() {
    return nodeSize;
  }
}

