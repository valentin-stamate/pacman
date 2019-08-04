class Pinky extends Ghost{
  private Cell cellToFollow;
  Pinky(int x, int y){
    super(x, y);
    this.cellToFollow = this.getRandomCell();
  }

  public void search() {
    // worst search

    if(super.x % sc == 0 && super.y % sc == 0){
      // picks a random point on map and follows that

      super.searchingList.remove(array.get(super.i).get(super.j));

      super.i = (int)super.y / sc;
      super.j = (int)super.x / sc;
      AStar(array.get(super.i).get(super.j), this.cellToFollow);
      super.searchingList = path;
    }

    if(super.searchingList.size() == 2){
      this.cellToFollow = this.getRandomCell();
    }

    super.update();
  }

  private Cell getRandomCell(){
    int i = 0, j = 0;
    while(a[i][j] == '1'){
      i = (int)random(0, 31);
      j = (int)random(0, 28);
    }
    Cell c = array.get(i).get(j);
    return c;
  }
}
