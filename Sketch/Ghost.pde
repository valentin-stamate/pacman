import java.util.ArrayList;
import java.util.List;

class Ghost {
  private float x, y;
  List<Cell> searchingList;
  private int dirX = 1, dirY = 0;
  private float speed = 2.5;

  Ghost(int x, int y){
    this.x = x;
    this.y = y;
  }

  public void update(){

    if(this.x % sc == 0 && this.y % sc == 0){
      int i = (int)this.y / sc;
      int j = (int)this.x / sc;


      AStar(array.get(i).get(j), array.get(pacman.j).get(pacman.i));

      searchingList = path;
      Cell up = null, left = null, down = null, right = null;
      try{
        up = array.get(i - 1).get(j);
      } catch (Exception e) {}
      try{
        left = array.get(i).get(j - 1);
      } catch (Exception e) {}
      try{
        down = array.get(i + 1).get(j);
      } catch (Exception e) {}
      try{
        right = array.get(i).get(j + 1);
      } catch (Exception e) {}

      if(up != null && this.searchingList.contains(up)){
        this.dirX = 0;
        this.dirY = -1;
      } else if(left != null && this.searchingList.contains(left)){
        this.dirX = -1;
        this.dirY = 0;
      } else if(down != null && this.searchingList.contains(down)){
        this.dirX = 0;
        this.dirY = 1;
      } else if(right != null && this.searchingList.contains(right)){
        this.dirX = 1;
        this.dirY = 0;
      }

    }

    this.x += this.dirX * this.speed;
    this.y += this.dirY * this.speed;

  }

  public void show(int r, int g, int b){
    noStroke();
    fill(r, g, b);
    circle(this.x, this.y, sc);
  }

}
