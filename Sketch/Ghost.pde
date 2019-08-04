import java.util.ArrayList;
import java.util.List;

class Ghost {
  private float x, y;
  private List<Cell> searchingList;
  private int dirX = 1, dirY = 0;
  private float speed = 2.5;
  private int i, j;
  private int r, g, b;

  Ghost(int x, int y){
    this.x = x;
    this.y = y;
    this.searchingList = new ArrayList<Cell>();
  }

  private void update(){
    if(this.x % sc == 0 && this.y % sc == 0){
      //search is called first so it's irrelevant
      // i = (int)this.y / sc;
      // j = (int)this.x / sc;

      Cell up = null, left = null, down = null, right = null;
      try{
        up = array.get(this.i - 1).get(this.j);
      } catch (Exception e) {}
      try{
        left = array.get(this.i).get(this.j - 1);
      } catch (Exception e) {}
      try{
        down = array.get(this.i + 1).get(this.j);
      } catch (Exception e) {}
      try{
        right = array.get(this.i).get(this.j + 1);
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

      try{
        Cell c = array.get(this.i + this.dirY).get(this.j + this.dirX);
      } catch(Exception e){
        this.dirX = 0;this.dirY = 0;
      }

    }

    this.x += this.dirX * this.speed;
    this.y += this.dirY * this.speed;

    this.show();

  }

  public void SetColor(int r, int g, int b) {
    this.r = r;this.g = g; this.b = b;
  }

  private void show(){
    noStroke();
    fill(this.r, this.g, this.b);
    circle(this.x, this.y, sc + 4);
  }

  public void drawPath(){
    for(Cell c : this.searchingList){
      c.show(200, 50, 30);
    }
  }

}
