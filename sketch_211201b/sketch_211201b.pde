import java.util.*;

int N_NODES = 6;

void setup(){
  // Define the adjacency list.
  ArrayList<Integer>[] adjacencyList = new ArrayList[N_NODES];
  adjacencyList[0] =  new ArrayList<Integer>(Arrays.asList(1, 2));
  adjacencyList[1] =  new ArrayList<Integer>(Arrays.asList(0, 3, 4));
  adjacencyList[2] =  new ArrayList<Integer>(Arrays.asList(0, 3, 5));
  adjacencyList[3] =  new ArrayList<Integer>(Arrays.asList(1, 2, 4));
  adjacencyList[4] =  new ArrayList<Integer>(Arrays.asList(1, 3, 5));
  adjacencyList[5] =  new ArrayList<Integer>(Arrays.asList(2, 4));
  
  ArrayList<ArrayList<Integer>> cycles = adjacencyListToCycleList(adjacencyList);
    
  println("-----------");
  for(ArrayList<Integer> cycle : cycles) logPath(cycle);
}

void draw(){}
