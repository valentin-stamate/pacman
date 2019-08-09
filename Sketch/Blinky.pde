// blinky alway chase pacman
// TODO Cruise Elroy (speed increasing)
class Blinky extends Ghost {
  Blinky(int i, int j){
    super(i, j);
    super.currentCell = array.get(i).get(j);
  }

  public void search() {

    if(super.x % sc == 0 && super.y % sc == 0){
      super.i = (int)super.y / sc;
      super.j = (int)super.x / sc;

      super.currentCell = array.get(super.i).get(super.j);

      // when is weak and can be eaten by pacman it choses a random cell
      if( (super.isWeak || super.isRecovering ) && super.isAffectedBy ){

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
        super.cellToFollow = pacman.currentCell;
      }

      AStar( super.currentCell, super.cellToFollow );
      super.searchingList = path;

    }
    super.update();
  }
}
