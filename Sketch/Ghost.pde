import java.util.ArrayList;
import java.util.List;

class Ghost {
  public float x, y;
  private List<Cell> searchingList;
  private int dirX = 1, dirY = 0;
  private float speed = 2.5;
  private int i, j;
  private int r, g, b;
  private Cell cellToFollow;
  private List<Cell> homeCells;
  private Cell currentCell;

  public boolean isWeak = false;
  public boolean isRecovering = false;

  public boolean isAffectedBy = false;

  // the weak time is controled by pacman.isInvincible
  private int recoveringCountDowm = 720;// 12 sec

  Ghost(int x, int y){
    this.x = x;
    this.y = y;
    this.searchingList = new ArrayList<Cell>();
    this.cellToFollow = this.getRandomCell();
    this.homeCells = new ArrayList<Cell>();

    for(int i = 13; i <= 15; i++){
      for(int j = 11; j <= 16; j ++){
        this.homeCells.add( array.get(i).get(j) );
      }
    }
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

      if(a[this.i + this.dirY][this.j + this.dirX] == '1'){
        this.dirX = 0;this.dirY = 0;
      }
      try{
        Cell c = array.get(this.i + this.dirY).get(this.j + this.dirX);
      } catch(Exception e){
        this.dirX = 0;this.dirY = 0;
      }

    }

    // for a bug, if not i think there is a 50% chance
    if(this.x % 2.5 == 0 && this.y % 2.5 == 0){
      if( (this.isWeak || this.isRecovering) && this.isAffectedBy){// TODO
        this.speed = 1.25;
      } else{
        this.speed = 2.5;
      }
    }

    if(this.isRecovering){
      if(this.recoveringCountDowm == 0){
        println("stops recovering");
        this.recoveringCountDowm = 720;
        this.isRecovering = false;
        this.isAffectedBy = false;
      } else {
        this.recoveringCountDowm --;
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
    if(this.isWeak)
      fill(27, 112, 247);
    if(this.isRecovering)
      fill(27, 112, 247, 100);
    circle(this.x, this.y, sc + 4);
  }

  public void makeWeak(){
    if(!this.isWeak && this.isAffectedBy){
      println("ghost weak");
      this.cellToFollow = this.getRandomCell();
      this.isWeak = true;
    }
  }

  public void makeNormal(){
    if(this.isWeak){
      println("ghost normal");
      this.isWeak = false;
      this.isAffectedBy = false;
    }
  }

  public void retreat(){
    if(!this.isRecovering && this.isAffectedBy){
      println("ghost retreat");
      this.isRecovering = true;
      this.isWeak = false;
      this.cellToFollow = this.getRandomCellFromHome();
    }
  }

  public void drawPath(){
    List<PVector> vectorPath = new ArrayList<PVector>();
    for(Cell c : this.searchingList){
      vectorPath.add( new PVector(c.j * sc, c.i * sc) );
    }
    strokeWeight(3);
    stroke(this.r, this.g, this.b);

    if(this.isWeak)
      stroke(27, 112, 247);
    if(this.isRecovering)
      stroke(27, 112, 247, 100);

    for(int i = 0; i < vectorPath.size() - 1; i ++){
      PVector current = vectorPath.get(i);
      PVector next = vectorPath.get(i + 1);
      if( i == vectorPath.size() - 2 ){
        next = new PVector(this.x, this.y);
      }
      line(current.x , current.y , next.x , next.y );
    }
  }

  private Cell getRandomCell(){

    int i = 0, j = 0;
    while(a[i][j] == '1'){
      i = (int)random(0, 31);
      j = (int)random(0, 28);
    }
    Cell c = array.get(i).get(j);

    return c;
  }

  private Cell getRandomCellFromHome(){
    int n = (int)random(0, this.homeCells.size());
    return this.homeCells.get(n);
  }

}
