// Pinky is the one who try to ambush pacman
// TODO work on pinky
class Pinky extends Ghost{
  private int newSearch = 8;
  Pinky(int i, int j){
    super(i, j);
  }

  public void search() {

    if(super.x % sc == 0 && super.y % sc == 0){
      super.i = (int)super.y / sc;
      super.j = (int)super.x / sc;

      this.newSearch --;

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
          super.cellToFollow = super.getCellInFrontOf(6);
          this.newSearch = 8;
        }
      }

      aStar(super.currentCell, super.cellToFollow);
      super.searchingList = path;

    }
    super.update();
  }

}
