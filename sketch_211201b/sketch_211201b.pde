import java.util.*;

void setup(){
  
  float[][][] setOfLines = {
    {{0, 0}, {100, 100}},
    {{0, 0}, {0, 100}},
    {{0, 50}, {100, 50}},
    {{0, 100}, {100, 100}}
  };
  
  ArrayList<Integer>[] adjacencyList = setOfLinesToAdjacencyList(setOfLines);
  ArrayList<ArrayList<Integer>> cycles = adjacencyListToCycleList(adjacencyList);
    
  //for(ArrayList<Integer> cycle : cycles) logPath(cycle);
  
}

void draw(){}
