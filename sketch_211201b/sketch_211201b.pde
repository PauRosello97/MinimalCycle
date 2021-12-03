import java.util.*;
ArrayList<PVector> intersections;
ArrayList<PShape> polygons;

void setup(){
  size(600, 600);
  background(255);
  
  PVector[][] setOfLines = {
    {new PVector(0, 0), new PVector(100, 100)},
    {new PVector(0, 0), new PVector(0, 100)},
    {new PVector(0, 50), new PVector(100, 50)},
    {new PVector(0, 100), new PVector(100, 100)},
    {new PVector(25, 0), new PVector(25, 75)}
  };
  intersections = new ArrayList<PVector>();
  ArrayList<Integer>[] adjacencyList = setOfLinesToAdjacencyList(setOfLines);
  ArrayList<ArrayList<Integer>> cycles = adjacencyListToCycleList(adjacencyList);
    
  println("\nCYCLES");
  for(ArrayList<Integer> cycle : cycles) logPath(cycle);
  polygons = cyclesToPolygons(cycles, intersections);
  
  for(PShape polygon : polygons) shape(polygon);
  
}

void draw(){}
