// Clyde search for the tile 8 away from pacman
class Clyde extends Ghost {
  private int newSearch = 10;
  Clyde(int i, int j){
    super(i, j);
    super.currentCell = array.get(i).get(j);
  }

  public void search() {

    if(super.x % sc == 0 && super.y % sc == 0){
      super.i = (int)super.y / sc;
      super.j = (int)super.x / sc;

      this.newSearch--;

      super.currentCell = array.get(super.i).get(super.j);

      // when is weak and can be eaten by pacman it choses a random cell
      if( (super.isWeak || super.isRecovering ) && super.isAffectedBy ){
        this.newSearch = 1;
        if(super.searchingList.size() <= 2 ){
          if(super.isWeak){
            super.cellToFollow = super.getRandomCell();
          } else if(super.isRecovering){
            super.cellToFollow = super.getRandomCellFromHouse();
          }
        }
      }
      else {
        // here is the specific behaviour
        if(this.newSearch == 0){
          super.cellToFollow = super.getCellInFrontOf(12);
          this.newSearch = 10;
        }
      }

      AStar( super.currentCell, super.cellToFollow );
      super.searchingList = path;

    }
    super.update();
  }
}
