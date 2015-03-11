//Current Class.
//Made from multiple nodes.

class ParticleSystemCurrent extends ParticleSystem {

  //Stores width and height.
  
  //float currentHeight;

  //ArrayList stores each node.
  ArrayList<Node> nodes = new ArrayList<Node>();

  //Current size.
  float currentWidth;

  //Tracks if an object is in the current.
  boolean isInCurrent=false;

  //Tracks if the current is on screen.
  boolean isOnScreen=false;

  //Constructor.
  ParticleSystemCurrent(PVector origin_) {
    super(origin_);
    //currentHeight = currentHeight_;

    //Adds nodes to the array list as long as the current is not the size of the width.
    while (currentWidth < width+200) {
      //Start with the first node as a reference.
      if (nodes.size()==0) {

        //Stores the size of the node.
        float tempSize = random(100);
        float nodePosOffset = random(-tempSize, tempSize);

        //Adds a node object to the ArrayList, randomizes the position of each node.
        nodes.add(new Node(new PVector(0, (height/2)+nodePosOffset), tempSize));

        //Adds the size of the node to the size counter of the current.
        currentWidth += tempSize;
      }

      //Add other nodes to current.
      else {
        //Stores the size of the node.
        float tempSize = random(100);
        float nodePosOffset = random(-tempSize, tempSize);

        //Stores the x position of the previous node.
        float nA = nodes.get(nodes.size()-1).getLocation().x-nodes.get(nodes.size()-1).getNodeSize()/2;

        //Adds nodes after the first one. Will be random but without overlapping.
        nodes.add(new Node(new PVector(nA-(tempSize/2), (height/2)+nodePosOffset), tempSize));

        //Adds the size of the node to the size counter of the current.
        currentWidth += tempSize;
      }
    }
  }

  //Display each node.
  void display() {
    for (int i = 0; i < nodes.size (); i++) {
      nodes.get(i).display();
    }
  }

  //Update current position.
  void update() {
    for (int i = 0; i < nodes.size (); i++) {
      nodes.get(i).update();
    }
  }

  //Applies forces on each node.
  void applyForces() {
    PVector waterPush = new PVector(.04, 0.0);
    for (int i = 0; i < nodes.size (); i++) {
      nodes.get(i).applyForce(waterPush);
    }
  }

  //Returns the node in contact with the jelly.
  ParticleNode isInCurrent(ParticleJelly jelly) {

    //Iterates through all the nodes.
    //Resets all nodes - for testing purposes only.
    for (int i=0; i < nodes.size (); i++) {
      nodes.get(i).fillColor=color(255);
    }
    for (int i=0; i < nodes.size (); i++) {
      //Stores node position.
      float tempNodeX = nodes.get(i).getLocation().x;
      float tempNodeY = nodes.get(i).getLocation().y;

      //Stores node size.
      float tempNodeSize = nodes.get(i).getNodeSize();

      //Checks if the boolean returned true.
      if (collidesWith(jelly, tempNodeX, tempNodeY, tempNodeSize/2)) {

        //Sets node color to green when a collision is detected.
        nodes.get(i).fillColor = color(0, 255, 0);
        return nodes.get(i);
      }
    }
    return null;
  }

  //Tracks if the jellfish is touching a node or not.
  boolean collidesWith(JellyFish jelly, float tempNodeX, float tempNodeY, float radius) {
    //Distance between a node and the jellyfish.
    float distance = dist(tempNodeX, tempNodeY, jelly.getLocation().x, jelly.getLocation().y);

    //Adds the radius of a node to the radius of the jellyfish.
    float sumRadius = radius + jelly.getJellySize()/2;

    //If distance is smaller than the radius, they are colliding.
    if (distance < sumRadius) {
      return true;
    }
    return false;
  }

  //Tracks if current is on screen.
  boolean isOnScreen() {
    //Check if the first node and last node are out of screen on the right side.
    if (nodes.get(0).getLocation().x > width && nodes.get(nodes.size()-1).getLocation().x > width) {
      return false;
    } 

    //Check if the first node and last node are out of screen on the left side.
    else if (nodes.get(0).getLocation().x < 0 && nodes.get(nodes.size()-1).getLocation().x < 0) {
      return false;
    } else {
      return true;
    }
  }

  //Gets the largest node.
  Node getLargestNodeInCurrent() {
    //Stores the size of the first node.
    Node maxNode = nodes.get(0);

    //Iterates through the array list.
    for (int i = 1; i < nodes.size ()-1; i++) {

      //Checks if the next node is bigger than the current biggest one.
      if (nodes.get(i).nodeSize > maxNode.nodeSize) {

        //Current parsed node becomes the biggest.
        maxNode = nodes.get(i);
      }
    }
    return maxNode;
  }
}

