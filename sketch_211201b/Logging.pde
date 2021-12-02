void logPath(ArrayList<Integer> path){
  for(Integer i : path){  
    print(i + " "); 
  }
  println("");
}

String pathToString(ArrayList<Integer> path){
  String m = "";
  for(Integer i : path){  
   m+= i + " "; 
  }
  return m;
}
