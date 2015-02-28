//Node object
//Those are the points of reference making a current

class Node {
  //PVector which store the location of the node

  PVector origin;
  //PVector which store the acceleration of the node
  //Might be applied on the full array (current) instead
  PVector acceleration;
  //PVector which store the attraction values of a node
  PVector attraction;

  PVector velocity;

  //Variable which store the size of a Node
  float nodeSize;
  float mass;
  float gravity;
  color fillColor =255;



  //Constructor
  Node(PVector origin_, float nodeSize_) {
    origin = origin_.get();

    nodeSize = nodeSize_;
    //mass = 20;
    //**sabine for now
    mass=1;
    gravity = 1;
    // acceleration = new PVector(3, 0);
    // SABINE ADD::
    velocity = new PVector(0, 0);
    acceleration = new PVector();
  }

  PVector attract(Mover mover) {
    PVector force = PVector.sub(origin, mover.origin);
    float distance = force.mag();
    distance = constrain(distance, 5.0, 25.0);
    force.normalize();
    float strength = (gravity * ((nodeSize/2)*mass) * mover.mass) / (distance * distance);
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

  void applyForce(PVector forceIn)
  {
    PVector f = forceIn.get();
    f.div(mass);
    acceleration.add(f);
  }

  //Update function of a node
  void update() {
    //Move the node with acceleration vector
    // origin.add(acceleration);

    //SABINE ADD::
    velocity.add(acceleration);
    // want to limit the velocity?
    velocity.limit(5);
    origin.add(velocity);
    acceleration.mult(0);
  }

  //Getter which return the nodeSize
  //Use this method to calculate the size of the current
  float getNodeSize() {
    return nodeSize;
  }
}

