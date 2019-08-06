class Pinky extends Ghost{
  Pinky(int x, int y){
    super(x, y);
  }

  public void search() {
    // worst search

    if(super.x % sc == 0 && super.y % sc == 0){
      super.i = (int)super.y / sc;
      super.j = (int)super.x / sc;

      super.currentCell = array.get(super.i).get(super.j);

      AStar(super.currentCell, super.cellToFollow);
      super.searchingList = path;

      if(super.searchingList.size() <= 2 ){
        if(super.isRecovering)
          super.cellToFollow = super.getRandomCellFromHome();
        else
          super.cellToFollow = super.getRandomCell();
      }
    }
    super.update();
  }

}
