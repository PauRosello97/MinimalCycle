import java.util.*;

int N_NODES = 6;
ArrayList<Integer>[] adjacencyList = new ArrayList[N_NODES];
ArrayList<ArrayList<Integer>> cycles;

void setup(){
  adjacencyList[0] =  new ArrayList<Integer>(Arrays.asList(1, 2));
  adjacencyList[1] =  new ArrayList<Integer>(Arrays.asList(0, 3, 4));
  adjacencyList[2] =  new ArrayList<Integer>(Arrays.asList(0, 3, 5));
  adjacencyList[3] =  new ArrayList<Integer>(Arrays.asList(1, 2, 4));
  adjacencyList[4] =  new ArrayList<Integer>(Arrays.asList(1, 3, 5));
  adjacencyList[5] =  new ArrayList<Integer>(Arrays.asList(2, 4));
  
  cycles = new ArrayList<ArrayList<Integer>>();
  
  ArrayList<Integer> path;
  path = new ArrayList<Integer>();
  path.add(0);
  followPath(path);    
  
  println("-------------------");
  for(ArrayList<Integer> cycle : cycles) logPath(cycle);
  
}

void followPath(ArrayList<Integer> oldPath){
  ArrayList<Integer> path = new ArrayList<Integer>();
  path.addAll(oldPath);
  
  ArrayList<Integer> neighbors = adjacencyList[path.get(path.size()-1)];
  
  println("---------------");
  println("Last node: " + path.get(path.size()-1));
  
  for(int i=0; i<adjacencyList[path.get(path.size()-1)].size(); i++){
    
    Integer k = adjacencyList[path.get(path.size()-1)].get(i);
    
    logPath(path);
    //println(path.get(path.size()-1) + " --> " + k);
    
    // If we found the end
    if(path.size()> 2 && k == path.get(0)){
      println("WE ARRIVED " + k + " // " + pathToString(path));
      ArrayList<Integer> cycle = new ArrayList<Integer>();
      cycle.addAll(path);
      cycles.add(cycle);
      
    }else if(!path.contains(k)){
      path.add(k);
      followPath(path);
    }
  }
}

void draw(){}
