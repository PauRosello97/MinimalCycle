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
  
  cycles = new ArrayList<ArrayList<Integer>>();
  
  // Start the path at the node 0 and follow it.
  for(int i=0; i<N_NODES; i++){
    ArrayList<Integer> p = new ArrayList<Integer>();
    p.add(i);
    followPath(p);  
  }
  
  println("-----------");
  for(ArrayList<Integer> cycle : cycles) logPath(cycle);
}

void followPath(ArrayList<Integer> path){    
  logPath(path);
  ArrayList<Integer> neighbors = adjacencyList[path.get(path.size()-1)];
  
  // Iterate through the neighbors
  for(int i=0; i<neighbors.size(); i++){
    
    // Pick a neighbor
    Integer k = neighbors.get(i);
    if(path.size()>2 && k==path.get(0)){
      //println("END");
      ArrayList<Integer> cycle = new ArrayList<Integer>();
      cycle.addAll(path);
      cycles.add(cycle);
    }else if(!path.contains(k)){
      path.add(k);
      followPath(path);
    }
  }
  path.remove(path.size()-1);
}

void draw(){}
