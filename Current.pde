class Current {
  PVector currentPos;
  float currentWidth;
  float currentHeight;

  //Node[] nodes = new Node[20];
  ArrayList<Node> nodes = new ArrayList<Node>();
  float totalSize;
  
  Current() {
    //    currentPos = currentPos_.get();
    //    currentWidth = currentWidth_;
    //    currentHeight = currentHeight_;
    while (totalSize < width) {
      if (nodes.size()==0) {
        float tempSize = random(100);
        nodes.add(new Node(new PVector(-width, height/2), tempSize));
        totalSize += tempSize;
      }
      else {
        float tempSize = random(100);
        nodes.add(new Node(new PVector((nodes.get(nodes.size()-1).origin.x)+(nodes.get(nodes.size()-1).getNodeSize()/2+(tempSize/2)), (height/2)), tempSize));
        totalSize += tempSize;
        //println(totalSize);
        //println(nodes.size());
      }
    }
  }

  void display() {
   for (int i = 0; i < nodes.size(); i++) {
      nodes.get(i).display();
   }
  }

  void update() {
    for (int i = 0; i < nodes.size(); i++) {
      nodes.get(i).update();
      
    }
  }
}

