// This module receives a set of lines and returns an adjacency list.

ArrayList<Integer>[] setOfLinesToAdjacencyList(float[][][] lines){
  
  ArrayList<float[]> intersections = new ArrayList<float[]>();
  ArrayList<float[][]> segments = new ArrayList<float[][]>();
  
  boolean[] splitedLines = new boolean[lines.length]; // This array is used to mark the lines that have been splited and can't be considered segments.
  
  for(int i=0; i<lines.length; i++){
    for(int j=i+1; j<lines.length; j++){
      float[] intersection = getIntersection(lines[i], lines[j]);
      if(intersection!=null){
        if(!intersections.contains(intersection)) intersections.add(intersection);
        
        // Let's manage the fist line.
        // If the intersection is not the beginning or ending of the line,
        // Then we have to split the line into segments.
        if(!(equals(lines[i][0],intersection) || equals(lines[i][1],intersection))){
          // We get two segments:
          float[][] segmentA = {lines[i][0], intersection};
          float[][] segmentB = {lines[i][1], intersection};
          segments.add(segmentA);
          segments.add(segmentB);
          splitedLines[i] = true;
        }
        
        // The same with the second line
        if(!(equals(lines[j][0],intersection) || equals(lines[j][1],intersection))){
          // We get two segments:
          float[][] segmentA = {lines[j][0], intersection};
          float[][] segmentB = {lines[j][1], intersection};
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
    float[][] segment = segments.get(i);
    boolean aIsIntersection = false;
    boolean bIsIntersection = false;
    for(float[] intersection : intersections){
      if(equals(segment[0], intersection)) aIsIntersection = true;
      if(equals(segment[1], intersection)) bIsIntersection = true;
    }
    if(!aIsIntersection || !bIsIntersection){
      segments.remove(i);
      if(i>0) i--;
    }
  }

  println("INTERSECTIONS:");
  for(float[] intersection : intersections) println("(" + intersection[0] + ", "+ intersection[1]+ ")" );

  println();
  println("SEGMENTS:");
  for(float[][] segment : segments) println("(" + segment[0][0] + ", " + segment[0][1] + ") - (" + segment[1][0] + ", " + segment[1][1] + ")");
  
  // Now we have a set of segments and intersections
  
  int N_NODES = 6;
  ArrayList<Integer>[] adjacencyList = new ArrayList[N_NODES];
  adjacencyList[0] =  new ArrayList<Integer>(Arrays.asList(1, 2));
  adjacencyList[1] =  new ArrayList<Integer>(Arrays.asList(0, 3, 4));
  adjacencyList[2] =  new ArrayList<Integer>(Arrays.asList(0, 3, 5));
  adjacencyList[3] =  new ArrayList<Integer>(Arrays.asList(1, 2, 4));
  adjacencyList[4] =  new ArrayList<Integer>(Arrays.asList(1, 3, 5));
  adjacencyList[5] =  new ArrayList<Integer>(Arrays.asList(2, 4));  
  
  return adjacencyList;
  
}

boolean equals(float[] a, float[] b){
  return abs(a[0]-b[0])<0.001 && abs(a[1]-b[1])<0.001;
}

float[] getIntersection(float[][] a, float[][] b) {
    float x1 = a[0][0];
    float y1 = a[0][1];
    float x2 = a[1][0];
    float y2 = a[1][1];
        
    float x3 = b[0][0];
    float y3 = b[0][1];
    float x4 = b[1][0];
    float y4 = b[1][1];
        
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
       
    float[] intersection = {x1+t*bx, y1+t*by};
    
    return intersection;
  }
