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

  //Variable which store the size of a Node
  float nodeSize;

  //Constructor
  Node(PVector origin_, float nodeSize_) {
    origin = origin_.get();
    nodeSize = nodeSize_;
    acceleration = new PVector(3, 0);
    //The attraction value is for now based on the size of the node
    attraction = new PVector(nodeSize/10, nodeSize/10);
  }

  //Display function of a node
  //Will be fully transparent later to hide the current
  void display() {
    ellipseMode(CENTER);
    fill(255);
    ellipse(origin.x, origin.y, nodeSize, nodeSize);
  }

  //Update function of a node
  void update() {
    //Move the node with acceleration vector
    origin.add(acceleration);
  }

  //Getter which return the nodeSize
  //Use this method to calculate the size of the current
  float getNodeSize() {
    return nodeSize;
  }
}

