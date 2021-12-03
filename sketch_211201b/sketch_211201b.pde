import java.util.*;

void setup(){
  
  PVector[][] setOfLines = {
    {new PVector(0, 0), new PVector(100, 100)},
    {new PVector(0, 0), new PVector(0, 100)},
    {new PVector(0, 50), new PVector(100, 50)},
    {new PVector(0, 100), new PVector(100, 100)},
    {new PVector(25, 0), new PVector(25, 75)}
  };
  
  ArrayList<Integer>[] adjacencyList = setOfLinesToAdjacencyList(setOfLines);
  ArrayList<ArrayList<Integer>> cycles = adjacencyListToCycleList(adjacencyList);
    
  //for(ArrayList<Integer> cycle : cycles) logPath(cycle);
  
}

void draw(){}
