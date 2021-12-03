// This module receives a set of lines and returns an adjacency list.

ArrayList<Integer>[] setOfLinesToAdjacencyList(ArrayList<PVector[]> lines){
  
  
  for(int i=0; i<lines.size(); i++){
      for(int j=i+1; j<lines.size(); j++){
        if(lines.get(i)[0]!=null && lines.get(j)[0]!=null){
        PVector intersection = getIntersection(lines.get(i), lines.get(j));
          if(intersection!=null){
            if(!intersections.contains(intersection)) intersections.add(intersection);
            
            // Let's manage the fist line.
            // If the intersection is not the beginning or ending of the line,
            // Then we have to split the line into segments.
            if(!(equals(lines.get(i)[0],intersection) || equals(lines.get(i)[1],intersection))){
              // We get two segments:
              PVector[] segmentA = {lines.get(i)[0], intersection};
              PVector[] segmentB = {lines.get(i)[1], intersection};
              lines.add(segmentA);
              lines.add(segmentB);
              
              lines.get(i)[0] = null;
              lines.get(i)[1] = null;
            }
            // The same with the second line
            if(!(equals(lines.get(j)[0],intersection) || equals(lines.get(j)[1],intersection))){
              // We get two segments:
              PVector[] segmentA = {lines.get(j)[0], intersection};
              PVector[] segmentB = {lines.get(j)[1], intersection};
              lines.add(segmentA);
              lines.add(segmentB);
              
              lines.get(j)[0] = null;
              lines.get(j)[1] = null;
            }
          }
        }
      }
  }
  
  // Remove segments that have nodes that are not intersections (because they don't create any polygon.
  // And null segments
  for(int i=0; i<lines.size(); i++){
    PVector[] segment = lines.get(i);
    if(!intersections.contains(segment[0]) || !intersections.contains(segment[1])){
      lines.remove(i);
      if(i>0) i--;
    }
  }
  
  for(int i=0; i<lines.size(); i++){
    if(lines.get(0)[0]==null){
      lines.remove(i);
      if(i>0) i--;
    }
  }
  

  println("INTERSECTIONS:");
  for(PVector intersection : intersections) println("(" + intersection.x + ", "+ intersection.y + ")" );

  println("\nSEGMENTS:");
  for(PVector[] segment : lines) println("(" + segment[0].x + ", " + segment[0].y + ") - (" + segment[1].x + ", " + segment[1].y + ")");
  
  // Now we have a set of segments and intersections
  // Lets translate segments to edges (position vectors to node connections)

  int nNodes = intersections.size();
  ArrayList<Integer>[] adjacencyList = new ArrayList[nNodes];
  for(int i=0; i<adjacencyList.length; i++) adjacencyList[i] = new ArrayList<Integer>();
  
  println("\nEDGES:");
  ArrayList<int[]> edges = new ArrayList<int[]>();
  for(PVector[] segment : lines){
    int nA = intersections.indexOf(segment[0]);
    int nB = intersections.indexOf(segment[1]);
    int[] edge = {nA, nB};
    edges.add(edge);
    println("("+nA+", "+nB+")");
    adjacencyList[nA].add(nB);
    adjacencyList[nB].add(nA);
  }
  
  println("\nADJACENCY LIST:");
  for(int i=0; i<adjacencyList.length; i++){
    print(i + " | ");
    for(int n : adjacencyList[i]){
      print(n + " ");
    }
    println("");
  }
    
  /*
  int N_NODES = 6;
  ArrayList<Integer>[] adjacencyList = new ArrayList[N_NODES];
  adjacencyList[0] =  new ArrayList<Integer>(Arrays.asList(1, 2));
  adjacencyList[1] =  new ArrayList<Integer>(Arrays.asList(0, 3, 4));
  adjacencyList[2] =  new ArrayList<Integer>(Arrays.asList(0, 3, 5));
  adjacencyList[3] =  new ArrayList<Integer>(Arrays.asList(1, 2, 4));
  adjacencyList[4] =  new ArrayList<Integer>(Arrays.asList(1, 3, 5));
  adjacencyList[5] =  new ArrayList<Integer>(Arrays.asList(2, 4));  */
  
  return adjacencyList;
  
}

boolean equals(PVector a, PVector b){
  return abs(a.x-b.x)<0.001 && abs(a.y-b.y)<0.001;
}

PVector getIntersection(PVector[] a, PVector[] b) {
    float x1 = a[0].x;
    float y1 = a[0].y;
    float x2 = a[1].x;
    float y2 = a[1].y;
        
    float x3 = b[0].x;
    float y3 = b[0].y;
    float x4 = b[1].x;
    float y4 = b[1].y;
        
    float bx = x2 - x1;
    float by = y2 - y1;
    float dx = x4 - x3;
    float dy = y4 - y3;
       
    float b_dot_d_perp = bx * dy - by * dx;
       
    if(b_dot_d_perp == 0){
        return null;
    }
       
    float cx = x3 - x1;
    float cy = y3 - y1;
       
    float t = (cx * dy - cy * dx) / b_dot_d_perp;
    if(t < 0 || t > 1){
        return null;
    }
       
    float u = (cx * by - cy * bx) / b_dot_d_perp;
    if(u < 0 || u > 1){
        return null;
    }
    
    PVector intersection = new PVector(x1+t*bx, y1+t*by);
          
    return intersection;
  }
