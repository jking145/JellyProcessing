//Current object
//Made from multiple nodes representing the current

class Current {
  //PVector which store the position of the current
  PVector currentPos;

  //To be used to store the calculated width and height of the current
  //float currentWidth;
  //float currentHeight;

  //ArrayList storing each nodes
  ArrayList<Node> nodes = new ArrayList<Node>();

  //Variable which will keep track the size of the current
  float totalSize;

  //Stores informations about the current
  //Stores if an object is in the current
  boolean isInCurrent=false;
  //Stores if the current is on screen
  boolean isOnScreen=false;

  //Current constructor
  Current() {
    //To be used to randomize the current
    //currentPos = currentPos_;
    //currentWidth = currentWidth_;
    //currentHeight = currentHeight_;

    //Add nodes to the array list as long as the current is not the size of the width
    while (totalSize < width+200) {
      //Start with the first node as a reference
      if (nodes.size()==0) {
        //Store the size of the node to keep track of the current size
        float tempSize = random(100);
        //Add a node object to the ArrayList, must randomize the position of each nodes
        nodes.add(new Node(new PVector(0, height/2), tempSize));
        //Add the size of the node to the size counter of the current
        totalSize += tempSize;
      }

      //Add other nodes after the first one
      else {
        //Store the size of the node to keep track of the current size
        float tempSize = random(100); 
        //Stores the position on X of the previous node
        float nA = nodes.get(nodes.size()-1).origin.x-nodes.get(nodes.size()-1).getNodeSize()/2;
        //Add nodes after the first one, will be random but without overlapping.
        nodes.add(new Node(new PVector(nA-(tempSize/2), (height/2)), tempSize));
        //Add the size of the node to the size counter of the current
        totalSize += tempSize;
      }
    }
  }

  //Display each nodes
  void display() {
    for (int i = 0; i < nodes.size (); i++) {
      nodes.get(i).display();
    }
  }

  //Update the position of each nodes
  void update() {
    for (int i = 0; i < nodes.size (); i++) {
      nodes.get(i).update();
    }
  }

  //Applies the force on each nodes of the current
  void applyForces() {
    PVector waterPush = new PVector(.04, 0.0);
    for (int i = 0; i < nodes.size (); i++) {
      nodes.get(i).applyForce(waterPush);
    }
  }



  //Function that returns the node which is touched by the jelly
  Node isInCurrent(JellyFish jelly) {
    //Goes through all the nodes
    for (int i=0; i < nodes.size (); i++) {
      //Stores the node position
      float tempNodeX = nodes.get(i).origin.x;
      float tempNodeY = nodes.get(i).origin.y;
      //Stores the node size
      float tempNodeSize = nodes.get(i).getNodeSize();
      //Check if the boolean returned true
      if (collidesWith(jelly, tempNodeX, tempNodeY, tempNodeSize/2)) {
        return nodes.get(i);
      }
    }
    return null;
  }

  //Track if the jellfish is touching a node or not.
  boolean collidesWith(JellyFish jelly, float tempNodeX, float tempNodeY, float radius) {
    //Distance between a node and the jelly
    float distance = dist(tempNodeX, tempNodeY, jelly.origin.x, jelly.origin.y);
    //Adding the radius of a node to the radius of the jelly
    float sumRadius = radius + jelly.jellySize/2;
    //If the distance is smaller than the sum, they are colliding
    if (distance < sumRadius) {
      return true;
    }
    return false;
  }
  
  //Let us know if the current is on screen
  boolean isOnScreen() {
    //Check if the first node and last node are out of screen on the right side
    if (nodes.get(0).origin.x > width && nodes.get(nodes.size()-1).origin.x > width) {
      return false;
    } 
    //Check if the first node and last node are out of screen on the left side
    else if (nodes.get(0).origin.x < 0 && nodes.get(nodes.size()-1).origin.x < 0) {
      return false;
    } else {
      return true;
    }
  }

  //Function getting the largest node
  Node getLargestNodeInCurrent() {
    //Stores the size of the first node
    Node maxNode = nodes.get(0);
    //Goes through the array list
    for (int i = 1; i < nodes.size ()-1; i++) {
      //Check if the next node is bigger than the current biggest one
      if (nodes.get(i).nodeSize > maxNode.nodeSize) {
        //Current parsed node become the biggest
        maxNode = nodes.get(i);
      }
    }
    return maxNode;
  }
}

