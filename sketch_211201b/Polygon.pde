class Polygon{
  
  PShape s;
  color c;

  Polygon(ArrayList<Integer> cycle){
    c = color(random(255), random(255), random(255));
    s = createShape();
    s.beginShape();
    for(Integer i : cycle){
      s.vertex(intersections.get(i).x, intersections.get(i).y);  
      s.fill(c);
    }
    s.endShape(CLOSE);
    
  }
  
  void draw(){
    shape(s);
  }
}
