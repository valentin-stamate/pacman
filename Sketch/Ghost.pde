import java.util.ArrayList;
import java.util.List;

class Ghost {
  private float x, y;
  private int i, j;
  private float speed = 2.5;
  private int dirX = 1, dirY = 0;
  private int r, g, b;
  private Cell currentCell, cellToFollow;
  private List<Cell> searchingList, ghostHouseCells;

  public boolean isWeak = false;
  public boolean isRecovering = false;
  public boolean isAffectedBy = false;
  private int recoveringCountDowm = 720;// 12 sec

  Ghost(int i, int j){
    this.x = j * sc;
    this.y = i * sc;
    this.searchingList = new ArrayList<Cell>();
    this.cellToFollow = this.getRandomCell();
    this.ghostHouseCells = new ArrayList<Cell>();

    for(int k = 13; k <= 15; k++){
      for(int l = 11; l <= 16; l ++){
        this.ghostHouseCells.add( array.get(k).get(l) );
      }
    }
  }

  private void update(){
    if(this.x % sc == 0 && this.y % sc == 0){

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

    if(this.x % 2.5 == 0 && this.y % 2.5 == 0){
      if( (this.isWeak || this.isRecovering) && this.isAffectedBy){
        this.speed = 1.25;
      } else{
        this.speed = 2.5;
      }
    }

    if(this.isRecovering){
      if(this.recoveringCountDowm == 0){
        //println("Stop Recovering");
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
      //println("Ghost Weak");
      this.cellToFollow = this.getRandomCell();
      this.isWeak = true;
    }
  }

  public void makeNormal(){
    if(this.isWeak){
      //println("Ghost Normal");
      this.isWeak = false;
      this.isAffectedBy = false;
    }
  }

  public void retreat(){
    if(!this.isRecovering && this.isAffectedBy){
      //println("Ghost Retreat");
      this.isRecovering = true;
      this.isWeak = false;
      this.cellToFollow = this.getRandomCellFromHouse();
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

  private Cell getRandomCellFromHouse(){
    int n = (int)random(0, this.ghostHouseCells.size());
    return this.ghostHouseCells.get(n);
  }

  private Cell getCellInFrontOf(int n){
    List<Cell> positions = new ArrayList<Cell>();
    int i = pacman.i + pacman.dirY;
    int j = pacman.j + pacman.dirX;

    Cell initial = array.get(pacman.i).get(pacman.j);
    Cell root = array.get(i).get(j);
    Cell c = null;

    for(int l = 1; l <= n; l ++){
      positions.clear();
      try{
        c = array.get(root.i - 1).get(root.j);
        if(!c.isWall)
          positions.add( c );
      } catch (Exception e){}
      try{
        c = array.get(root.i).get(root.j - 1);
        if(!c.isWall)
          positions.add( c );
      } catch (Exception e){}
      try{
        c = array.get(root.i + 1).get(root.j);
        if(!c.isWall)
          positions.add( c );
      } catch (Exception e){}
      try{
        c = array.get(root.i).get(root.j + 1);
        if(!c.isWall)
          positions.add( c );
      } catch (Exception e){}

      positions.remove(initial);
      initial = root;

      int x = (int)random(0, positions.size());
      try{
        root = positions.get(x);
      } catch(Exception e){
        root = this.getRandomCell();
        break;
      }
    }
    // fill(255, 0, 0);
    // rect(root.j * sc, root.i * sc, sc, sc);
    return root;
  }

  public float getX() {
    return this.x;
  }

  public float getY() {
    return  this.y;
  }

  public int getI() {
    return this.i;
  }

  public int getJ() {
    return this.j;
  }
}
