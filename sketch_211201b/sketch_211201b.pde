import java.util.*;
ArrayList<PVector> intersections;
ArrayList<PShape> polygons;

void setup(){
  size(600, 600);
  background(255);
  
  
  PVector[] lA = {new PVector(0, 0), new PVector(100, 100)};
  PVector[] lB = {new PVector(0, 0), new PVector(0, 100)};
  PVector[] lC = {new PVector(0, 50), new PVector(100, 50)};
  PVector[] lD = {new PVector(0, 100), new PVector(100, 100)};
  PVector[] lE = {new PVector(25, 0), new PVector(25, 75)};
  
  ArrayList<PVector[]> lines = new ArrayList<PVector[]>();
  
  lines.add(lA);
  lines.add(lB);
  lines.add(lC);
  lines.add(lD);
  lines.add(lE);
  
  for(int i=0; i<10; i++){
    PVector[] newLine = {new PVector(random(width), random(height)), new PVector(random(width), random(height))};
    //lines.add(newLine);
  }
  
  intersections = new ArrayList<PVector>();
  ArrayList<Integer>[] adjacencyList = setOfLinesToAdjacencyList(lines);
  ArrayList<ArrayList<Integer>> cycles = adjacencyListToCycleList(adjacencyList);
    
  println("\nCYCLES");
  for(ArrayList<Integer> cycle : cycles) logPath(cycle);
  polygons = cyclesToPolygons(cycles, intersections);
  
  for(PShape polygon : polygons) shape(polygon);
    
}

void draw(){
}
