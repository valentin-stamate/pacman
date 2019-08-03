
Cell q = null;
void AStar(Cell start, Cell end){
  List<Cell> openList = new ArrayList<Cell>();
  List<Cell> closedList = new ArrayList<Cell>();
  path = new ArrayList<Cell>();
  
  resetParents();

  openList.add( start );
  start.f = 0;
  while( !openList.isEmpty() ){
    q = openList.get(0);
    for(Cell c : openList){
      if(c.f < q.f)
        q = c;
    }
    openList.remove(q);
    List<Cell> successors = getSuccessors(q);
    for(Cell s : successors){
      if( !closedList.contains(s) ){
        if(s == end){
          s.parent = q;
          getPath();
          return;
        }
        float newG, newH, newF;
        newG = q.g + 1;
        newH = heuristic(s, end);
        newF = newG + newH;

        if(s.f == Float.MAX_VALUE || s.f > newF){
          openList.add(s);
          s.f = newF;
          s.g = newG;
          s.h = newH;
          s.parent = q;
        }
      }
    }
    closedList.add(q);
  }
}

List<Cell> getSuccessors(Cell cell){
  List<Cell> s = new ArrayList<Cell>();
  try{
    Cell up = array.get(cell.i - 1).get(cell.j);
    if(!up.isWall)
      s.add(up);
  } catch (Exception e) {}
  try{
    Cell left = array.get(cell.i).get(cell.j - 1);
    if(!left.isWall)
      s.add(left);
  } catch (Exception e) {}
  try{
    Cell down = array.get(cell.i + 1).get(cell.j);
    if(!down.isWall)
      s.add(down);
  } catch (Exception e) {}
  try{
    Cell right = array.get(cell.i).get(cell.j + 1);
    if(!right.isWall)
      s.add(right);
  } catch (Exception e) {}
  return s;
}

float heuristic(Cell a, Cell b){
  return dist( a.j, a.i, b.j, b.i );
  //return abs( a.i - b.i ) + abs( a.j - b.j );
}

void getPath(){
  Cell temp = q;
  path.add(temp);
  while( temp.parent != null ){
    path.add(temp.parent);
    temp = temp.parent;
  }
}

void resetParents(){
  for(int i = 0; i < rows; i++){
    for(int j = 0; j < cols; j ++){
      array.get(i).get(j).resetCell();
    }
  }
}