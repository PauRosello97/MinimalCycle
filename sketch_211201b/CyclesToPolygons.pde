ArrayList<PShape> cyclesToPolygons(ArrayList<ArrayList<Integer>> cycles, ArrayList<PVector> intersections){
  
  ArrayList<PShape> shapes = new ArrayList<PShape>();
  
  for(ArrayList<Integer> cycle : cycles){
      PShape s = createShape();
      s.beginShape();
      for(Integer i : cycle){
        s.vertex(intersections.get(i).x, intersections.get(i).y);  
      }
      s.endShape(CLOSE);
      shapes.add(s);
  }
  
 
  return shapes;
  
}
