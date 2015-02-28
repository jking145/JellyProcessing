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

  //sabine add
  //Update the position of each nodes
  void checkBounds() {
    Node removedN =null;

    for (int i = nodes.size ()-1; i >0; i--) {

      if (nodes.get(i).origin.x>width)
      {

        // set the new origin to the last nodes position... -> so remove this one from the list and add on to the end..
        removedN = nodes.remove(i);
      }
    }

    if (removedN!=null)
    {
      // println(removedN.nodeSize);
      //  float tempSize = random(100);
      //Add nodes after the first one, must be random but without overlapping.
      float nA = nodes.get(nodes.size()-1).origin.x- nodes.get(nodes.size()-1).getNodeSize()/2;
      nodes.add(new Node(new PVector(nA-(removedN.nodeSize/2), (height/2)), removedN.nodeSize));
      nodes.get(nodes.size()-1).velocity= removedN.velocity.get();
      nodes.get(nodes.size()-1).fillColor= removedN.fillColor;
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

