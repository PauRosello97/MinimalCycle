import java.util.*;

int N_NODES = 4;
ArrayList<Integer>[] adjacencyList = new ArrayList[N_NODES];

void setup(){
  // Define the adjacency list.
  adjacencyList[0] =  new ArrayList<Integer>(Arrays.asList(1));
  adjacencyList[1] =  new ArrayList<Integer>(Arrays.asList(0, 2, 3));
  adjacencyList[2] =  new ArrayList<Integer>(Arrays.asList(1, 3));
  adjacencyList[3] =  new ArrayList<Integer>(Arrays.asList(1, 2));
  
  // Start the path at the node 0 and follow it.
  ArrayList<Integer> p;
  p = new ArrayList<Integer>();
  p.add(0);
  followPath(p);    
}

void followPath(ArrayList<Integer> path){    
  //println("-------------");  
  logPath(path);
  ArrayList<Integer> neighbors = adjacencyList[path.get(path.size()-1)];
  
  // Iterate through the neighbors
  for(int i=0; i<neighbors.size(); i++){
    
    // Pick a neighbor
    Integer k = neighbors.get(i);
    
    if(!path.contains(k)){
      path.add(k);
      followPath(path);
    }
  }
  path.remove(path.size()-1);
}

void draw(){}
