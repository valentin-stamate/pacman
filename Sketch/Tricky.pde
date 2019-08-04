class Tricky extends Ghost{
  Tricky(int x, int y){
    super(x, y);
  }

  public void search() {
    // best search
    if(super.x % sc == 0 && super.y % sc == 0){

      super.i = (int)super.y / sc;
      super.j = (int)super.x / sc;

      AStar(array.get(super.i).get(super.j), pacman.oldPosition);
      super.searchingList = path;

    }
    super.update();
  }
}
