class Tricky extends Ghost{
  Tricky(int x, int y){
    super(x, y);
  }

  public void search() {

    if(super.x % sc == 0 && super.y % sc == 0){

      super.i = (int)super.y / sc;
      super.j = (int)super.x / sc;

      super.currentCell = array.get(super.i).get(super.j);

      if( (super.isWeak || super.isRecovering ) && super.isAffectedBy ){
        // pincky style
        super.searchingList.remove( super.currentCell );

        AStar(array.get(super.i).get(super.j), super.cellToFollow);
        super.searchingList = path;

        if(super.searchingList.size() <= 2){
          if(super.isWeak)
            super.cellToFollow = super.getRandomCell();
          else if(super.isRecovering)
            super.cellToFollow = super.getRandomCellFromHome();
        }
      } else {
        AStar(super.currentCell, pacman.oldPosition);
        super.searchingList = path;
      }

    }
    super.update();
  }
}
