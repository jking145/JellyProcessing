//Node Class.
//Nodes are points of reference making the current.

class ParticleNode extends Particle {
  //The Node tracks orign, acceleration, attraction, and velocity.
  PVector attraction;

  //Variables which store different parameters related to a node.
  float nodeSize;
  float mass;
  float gravity;
  color fillColor = 255;

  //Constructor.
  ParticleNode(PVector location_, PVector velocity_, PVector acceleration_, float nodeSize_) {
    //Call the parent constructor.
    super(location_, velocity_, acceleration_, nodeSize_);

    location = location_.get();
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
  PVector attract(ParticleJelly jelly) {
    //Makes a new force resulting from the substraction between the node and the jelly.
    PVector force = PVector.sub(location, jelly.location);

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
    ellipse(location.x, location.y, nodeSize, nodeSize);
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
    location.add(velocity);

    //Resets acceleration.
    acceleration.mult(0);
  }

  //Get nodeSize.
  //Use this method to calculate the size of the current.
  float getNodeSize() {
    return nodeSize;
  }

  //Get origin.
  PVector getLocation() {
    return location.get();
  }
}

