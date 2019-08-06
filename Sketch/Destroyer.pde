class Destroyer extends Ghost {
  Destroyer(int x, int y){
    super(x, y);
    super.currentCell = array.get(y / sc).get(x / sc);
  }

  public void search() {
    // best search
    if(super.x % sc == 0 && super.y % sc == 0){
      super.i = (int)super.y / sc;
      super.j = (int)super.x / sc;

      super.currentCell = array.get(super.i).get(super.j);
      // when is weak and can be af
      if( (super.isWeak || super.isRecovering ) && super.isAffectedBy ){
        // pincky style
        super.searchingList.remove( super.currentCell );

        AStar(super.currentCell, super.cellToFollow);
        super.searchingList = path;

        if(super.searchingList.size() <= 2 ){
          if(super.isWeak)
            super.cellToFollow = super.getRandomCell();
          else if(super.isRecovering)
            super.cellToFollow = super.getRandomCellFromHome();
        }

      } else {
        AStar( super.currentCell, pacman.currentCell );
        super.searchingList = path;
      }
    }
    super.update();
  }
}
