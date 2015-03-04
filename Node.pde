//Node Class.
//Nodes are points of reference making the current.

class Node {
  //The Node tracks orign, acceleration, vattraction, and velocity.
  PVector origin;
  PVector acceleration;
  PVector attraction;
  PVector velocity;

  //Variables which store different parameters related to a node.
  float nodeSize;
  float mass;
  float gravity;
  color fillColor = 255;

  //Constructor.
  Node(PVector origin_, float nodeSize_) {
    origin = origin_.get();
    nodeSize = nodeSize_;

    //For now, mass is set to 1 for beta-testing.
    mass = 1;
    gravity = 5;

    //Makes new velocity vector.
    velocity = new PVector(0, 0);

    //Makes new acceleration vector.
    acceleration = new PVector();
  }

  //PVector that attracts the jelly to a node.
  PVector attract(JellyFish jelly) {
    //Makes a new force resulting from the substraction between the node and the jelly.
    PVector force = PVector.sub(origin, jelly.origin);

    //Stores the magnitude of the force as a distance.
    float distance = force.mag();

    //Constrain the distance.
    distance = constrain(distance, 5.0, 25.0);

    //Normalize the force.
    force.normalize();

    //Strength of attraction formula.
    float strength = (gravity * ((nodeSize/2)*mass) * jelly.mass) / (distance * distance);

    //Multiplies the normalized force by strength.
    force.mult(strength);
    return force;
  }


  //Displays function of a node.
  //Will be fully transparent later to hide the current.
  void display() {
    ellipseMode(CENTER);
    fill(fillColor);
    ellipse(origin.x, origin.y, nodeSize, nodeSize);
  }

  //Applys the inputed force from current (waterPush).
  void applyForce(PVector forceIn) {
    PVector f = forceIn.get();
    f.div(mass);
    acceleration.add(f);
  }

  //Update nodes.
  void update() {
    //Applies acceleration to velocity.
    velocity.add(acceleration);

    //Limits velocity.
    velocity.limit(5);

    //Adds velocity to the origin.
    origin.add(velocity);

    //Resets acceleration.
    acceleration.mult(0);
  }

  //Get nodeSize.
  //Use this method to calculate the size of the current.
  float getNodeSize() {
    return nodeSize;
  }

  //Get origin.
  PVector getOrigin() {
    return origin.get();
  }
}

