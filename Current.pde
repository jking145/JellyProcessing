//Current object
//Made from multiple nodes representing the current

class Current {
  //PVector which store the position of the current
  PVector currentPos;

  float currentWidth;
  float currentHeight;

  //ArrayList storing each nodes
  ArrayList<Node> nodes = new ArrayList<Node>();

  //Variable which will keep track the size of the current
  float totalSize;

  boolean isInCurrent=false;
  boolean isOnScreen=false;
  
  //Current constructor
  Current() {
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
        //Add nodes after the first one, must be random but without overlapping.
        //nodes.add(new Node(new PVector((nodes.get(nodes.size()-1).origin.x)-(nodes.get(nodes.size()-1).getNodeSize()/2+(tempSize/2)), (height/2)), tempSize));

        //p1
        float nA = nodes.get(nodes.size()-1).origin.x-nodes.get(nodes.size()-1).getNodeSize()/2;
        nodes.add(new Node(new PVector(nA-(tempSize/2), (height/2)), tempSize));
        //Add the size of the node to the size counter of the current
        totalSize += tempSize;
        // println(nodes.size());
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

  //sabine add
  //make the water current actually move
  void applyForces() {
    PVector waterPush = new PVector(.04, 0.0);
    for (int i = 0; i < nodes.size (); i++) {
      nodes.get(i).applyForce(waterPush);
    }
  }

  //Let us know if the jellyfish is in the current or not.
  boolean isInCurrent() {
    //Goes through all the nodes
    for (int i=0; i < nodes.size (); i++) {
      //Stores the node position
      float tempNodeX = nodes.get(i).origin.x;
      float tempNodeY = nodes.get(i).origin.y;
      //Stores the node size
      float tempNodeSize = nodes.get(i).getNodeSize();
      //rollover processing.org
      //Distance between the node and the jelly.
      float disX = tempNodeX - jelly.origin.x;
      float disY = tempNodeY - jelly.origin.y;
      //Node area formula
      if (sqrt(sq(disX) + sq(disY)) < tempNodeSize/2) {
        return true;
      } else {
        return false;
      }
    }
    return false;
  }

  boolean isOnScreen() {
    if (nodes.get(0).origin.x > width && nodes.get(nodes.size()-1).origin.x > width) {
      return false;
    } else if (nodes.get(0).origin.x < 0 && nodes.get(nodes.size()-1).origin.x < 0) {
      return false;
    } else {
      return true;
    }
  }


  Node getLargestNodeInCurrent()
  {
    Node maxNode = nodes.get(0);
    for (int i = 1; i <nodes.size ()-1; i++) {
      if (nodes.get(i).nodeSize > maxNode.nodeSize)
      {
        // max this current max
        maxNode = nodes.get(i);
      }
    }
    return maxNode;
  }
}

