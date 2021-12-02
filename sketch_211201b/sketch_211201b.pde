import java.util.*;

int N_NODES = 6;
ArrayList<Integer>[] adjacencyList = new ArrayList[N_NODES];
ArrayList<ArrayList<Integer>> cycles;

void setup(){
  // Define the adjacency list.
  adjacencyList[0] =  new ArrayList<Integer>(Arrays.asList(1, 2));
  adjacencyList[1] =  new ArrayList<Integer>(Arrays.asList(0, 3, 4));
  adjacencyList[2] =  new ArrayList<Integer>(Arrays.asList(0, 3, 5));
  adjacencyList[3] =  new ArrayList<Integer>(Arrays.asList(1, 2, 4));
  adjacencyList[4] =  new ArrayList<Integer>(Arrays.asList(1, 3, 5));
  adjacencyList[5] =  new ArrayList<Integer>(Arrays.asList(2, 4));
  
  // ArrayList for the found cycles.
  cycles = new ArrayList<ArrayList<Integer>>();
  
  // Start the path at the node 0 and follow it.
  ArrayList<Integer> p;
  p = new ArrayList<Integer>();
  p.add(0);
  followPath(p);    
  
  // Then print all the cycles found.
  println("-------------------");
  for(ArrayList<Integer> cycle : cycles) logPath(cycle);
}

void followPath(ArrayList<Integer> oldPath){
  // Create a variable for the path in this function scope.
  ArrayList<Integer> path = new ArrayList<Integer>();
  path.addAll(oldPath);
    
  logPath(path);
  
  // Iterate through the neighbors
  for(int i=0; i<adjacencyList[path.get(path.size()-1)].size(); i++){
    
    // Pick a neighbor
    Integer k = adjacencyList[path.get(path.size()-1)].get(i);
    
    // If it's the end of the cycle
    if(path.size()> 2 && k == path.get(0)){
      //println("WE ARRIVED " + k + " // " + pathToString(path));
      //ArrayList<Integer> cycle = new ArrayList<Integer>();
      //cycle.addAll(path);
      //cycles.add(cycle);
      
    // If it's not already in the path, continue.
    }else if(!path.contains(k)){
      path.add(k);
      followPath(path);
    }
  }
}

void draw(){}
