class Polygon{
  
  PShape s;

  Polygon(ArrayList<Integer> cycle){
    s = createShape();
    s.beginShape();
    for(Integer i : cycle){
      s.vertex(intersections.get(i).x, intersections.get(i).y);  
    }
    s.endShape(CLOSE);
  }
  
  void draw(){
    shape(s);
  }
}
