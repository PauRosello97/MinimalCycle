ArrayList<Polygon> cyclesToPolygons(ArrayList<ArrayList<Integer>> cycles, ArrayList<PVector> intersections){
  
  ArrayList<Polygon> polygons = new ArrayList<Polygon>();
  
  for(ArrayList<Integer> cycle : cycles){
      Polygon p = new Polygon(cycle);
      polygons.add(p);
  }
  
 
  return polygons;
  
}
