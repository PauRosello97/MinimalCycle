// This modules receives an adjacency list and returns a list of cycles.
// Not only the minimal basis cycles are detected, so to hide the cycles
// containing other cycles, the returned list is sorted by the size of
// the cycles. This should be adressed in future versions.

ArrayList<ArrayList<Integer>> adjacencyListToCycleList(ArrayList<Integer>[] adjacencyList){
  
  ArrayList<ArrayList<Integer>> cycles = new ArrayList<ArrayList<Integer>>();
  
  for(int i=0; i<adjacencyList.length; i++){
    ArrayList<Integer> p = new ArrayList<Integer>();
    p.add(i);
    //followPath(p, cycles, adjacencyList);  
  }
  
  Collections.sort(cycles, new Comparator<ArrayList<Integer>> () {
    @Override
    public int compare(ArrayList<Integer> a, ArrayList<Integer> b) {
        return a.size()-b.size();
    }
  });
  
  // Remove repeated cycles
  for(int i=0; i<cycles.size(); i++){
    for(int j=i+1; j<cycles.size(); j++){
      if(contains(cycles.get(i), cycles.get(j))){
        cycles.remove(j);
        if(j>i) j--;
      }else if(contains(cycles.get(j), cycles.get(i))){
        cycles.remove(i);
        if(i>0) i--;
        j=i;
      }
    }
  }
  
  return cycles;
}

// Checks if B contains A or A==B
boolean contains(ArrayList<Integer> a, ArrayList<Integer> b){
  for(Integer i : a){
    if(!b.contains(i)) return false;  
  }
  return true;
}

void followPath(ArrayList<Integer> path, ArrayList<ArrayList<Integer>> cycles, ArrayList<Integer>[] adjacencyList){    
  //logPath(path);
  ArrayList<Integer> neighbors = adjacencyList[path.get(path.size()-1)];
  
  // Iterate through the neighbors
  for(int i=0; i<neighbors.size(); i++){
    
    // Pick a neighbor
    Integer k = neighbors.get(i);
    if(path.size()>2 && k==path.get(0)){
      ArrayList<Integer> cycle = new ArrayList<Integer>();
      cycle.addAll(path);
      cycles.add(cycle);
    }else if(!path.contains(k)){
      path.add(k);
      followPath(path, cycles, adjacencyList);
    }
  }
  path.remove(path.size()-1);
}
