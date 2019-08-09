class PacMan{
  public float x = 12 * sc, y = 23 * sc;
  private int dirLineX = 12, dirLineY = 23;
  public int dirX = -1, dirY = 0;
  private int newDirX, newDirY;
  private float speed = 2.5; // math stuff , 2.5 * 8 = sc

  public int i, j;
  public boolean isInvincible = false;
  private int countDown = 600;
  public Cell currentCell = array.get(23).get(12);

  public void update(){

    if( this.x % 20 == 0 && this.y % 20 == 0 ){

      this.i = (int)this.y / sc;
      this.j = (int)this.x / sc;

      food.remove( array.get(this.i).get(this.j) );

      if( this.checkBonus() ){
        this.isInvincible = true;
        this.countDown = 600;
      }

      if( a[ this.i ][ this.j ] == '-' && this.j == 0){
        this.x = 27 * sc;
        this.j = 27;
      } else if( a[ this.i ][ this.j ] == '-' && this.j == 27){
        this.x = 0;
        this.j = 0;
      }

      int newPositionX = this.j + this.newDirX;
      int newPositionY = this.i + this.newDirY;

      int nextPositionX = this.j + this.dirX;
      int nextPositionY = this.i + this.dirY;

      if( a[ nextPositionY ][ nextPositionX ] == '1'){
        this.dirX = 0;
        this.dirY = 0;
      }

      // for a little bug when teleport
      try{
        if( a[ newPositionY ][ newPositionX ] != '1' ){
          this.dirX = this.newDirX;
          this.dirY = this.newDirY;
        }
      }
      catch(Exception e){}

      this.currentCell = array.get(this.i).get(this.j);

    }

    if(this.isInvincible){
      if(this.countDown != 0 ){
        this.countDown --;
      } else {
        //println("PacMan Is Normal");
        this.isInvincible = false;
      }
    }

    this.x += this.dirX * this.speed;
    this.y += this.dirY * this.speed;

    this.show();
  }

  private void show(){
    noStroke();
    fill(255, 255, 0);
    circle(this.x, this.y, 25);
  }

  public void changeDir(int dirX, int dirY){
    this.newDirX = dirX;
    this.newDirY = dirY;
  }

  private boolean checkBonus(){
    if( bonusFood.contains( array.get(this.i).get(this.j) ) ){
      blinky.isAffectedBy = true;
      pinky.isAffectedBy = true;
      inky.isAffectedBy = true;
      clyde.isAffectedBy = true;
      bonusFood.remove( array.get(this.i).get(this.j) );
      //println("PacMan Is Invincible");
      return true;
    }
    return false;
  }

}
