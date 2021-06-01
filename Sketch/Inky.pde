// Inky is dummy
class Inky extends Ghost{
  Inky(int x, int y){
    super(x, y);
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
        int possibleI = 2 * pacman.i - blinky.getI();
        int possibleJ = 2 * pacman.j - blinky.getJ();
        // for the explanation of what he follows search it on Google
        try{
          if( !array.get(possibleI).get(possibleJ).isWall )
            super.cellToFollow = array.get(possibleI).get(possibleJ);
        } catch(Exception e){
          if(super.searchingList.size() <= 2)
            super.cellToFollow = super.getRandomCell();
        }
      }

      aStar( super.currentCell, super.cellToFollow );
      super.searchingList = path;

    }
    super.update();
  }
}
