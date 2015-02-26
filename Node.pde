class Node {

  PVector origin;
  PVector acceleration;
  float nodeSize;

  Node(PVector origin_, float nodeSize_) {
    origin = origin_.get();
    nodeSize = nodeSize_;
    acceleration = new PVector(3,0);
  }

  void display() {
    ellipseMode(CENTER);
    fill(255);
    ellipse(origin.x, origin.y, nodeSize, nodeSize);
  }

  void update() {
    origin.add(acceleration);
    
//    if (origin.x > width) {
//      origin.x = 0;
//    }
  }
  
  float getNodeSize() {
    return nodeSize;
  }
  
}
