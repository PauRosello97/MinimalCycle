// This module receives a set of lines and returns an adjacency list.

ArrayList<Integer>[] setOfLinesToAdjacencyList(PVector[][] lines){
  
  ArrayList<PVector> intersections = new ArrayList<PVector>();
  ArrayList<PVector[]> segments = new ArrayList<PVector[]>();
  
  boolean[] splitedLines = new boolean[lines.length]; // This array is used to mark the lines that have been splited and can't be considered segments.
  
  for(int i=0; i<lines.length; i++){
    for(int j=i+1; j<lines.length; j++){
      PVector intersection = getIntersection(lines[i], lines[j]);
      if(intersection!=null){
        if(!intersections.contains(intersection)) intersections.add(intersection);
        
        // Let's manage the fist line.
        // If the intersection is not the beginning or ending of the line,
        // Then we have to split the line into segments.
        if(!(equals(lines[i][0],intersection) || equals(lines[i][1],intersection))){
          // We get two segments:
          PVector[] segmentA = {lines[i][0], intersection};
          PVector[] segmentB = {lines[i][1], intersection};
          segments.add(segmentA);
          segments.add(segmentB);
          splitedLines[i] = true;
        }
        
        // The same with the second line
        if(!(equals(lines[j][0],intersection) || equals(lines[j][1],intersection))){
          // We get two segments:
          PVector[] segmentA = {lines[j][0], intersection};
          PVector[] segmentB = {lines[j][1], intersection};
          segments.add(segmentA);
          segments.add(segmentB);
          splitedLines[j] = true;
        }
      }
    }
  }

  for(int i=0; i<lines.length; i++){
    if(!splitedLines[i]) segments.add(lines[i]);
  }
  
  // Remove segments that have nodes that are not intersections (because they don't create any polygon.
  for(int i=0; i<segments.size(); i++){
    PVector[] segment = segments.get(i);
    if(!intersections.contains(segment[0]) || !intersections.contains(segment[1])){
      segments.remove(i);
      if(i>0) i--;
    }
  }

  println("INTERSECTIONS:");
  for(PVector intersection : intersections) println("(" + intersection.x + ", "+ intersection.y + ")" );

  println("\nSEGMENTS:");
  for(PVector[] segment : segments) println("(" + segment[0].x + ", " + segment[0].y + ") - (" + segment[1].x + ", " + segment[1].y + ")");
  
  // Now we have a set of segments and intersections
  // Lets translate segments to edges (position vectors to node connections)
  
  println("\nEDGES:");
  ArrayList<int[]> edges = new ArrayList<int[]>();
  for(PVector[] segment : segments){
    int nA = intersections.indexOf(segment[0]);
    int nB = intersections.indexOf(segment[1]);
    int[] edge = {nA, nB};
    edges.add(edge);
    println("("+nA+", "+nB+")");
  }
  
  int nNodes = intersections.size();
  ArrayList<Integer>[] adjacencyList = new ArrayList[nNodes];
  
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
       
    
    return new PVector(x1+t*bx, y1+t*by);
  }
