class PacManPlayer{
  private float x = 12 * sc, y = 23 * sc;
  private int dirLineX = 12, dirLineY = 23;
  private int dirX = -1, dirY = 0;
  private int newDirX, newDirY;
  private float speed = 2.5; // math stuff ;) , 1.25 * 16 = sc
  private int oldX = 7, oldY = 24;

  public void update(){
    if( a[ this.oldY ][ this.oldX ] != '-' )
      a[ this.oldY ][ this.oldX ] = 'X';

    if( this.x % 20 == 0 && this.y % 20 == 0 ){

      int i = (int)this.x / sc;
      int j = (int)this.y / sc;

      if( a[ j ][ i ] == '-' && i == 0){
        this.x = 27 * sc;
        i = 27;
      } else if( a[ j ][ i ] == '-' && i == 27){
        this.x = 0;
        i = 0;
      }

      int newPositionX = i + this.newDirX;
      int newPositionY = j + this.newDirY;

      int nextPositionX = i + this.dirX;
      int nextPositionY = j + this.dirY;

      if( a[ nextPositionY ][ nextPositionX ] == '1'){
        this.dirX = 0;
        this.dirY = 0;
      }

      if( a[ newPositionY ][ newPositionX ] != '1' ){
        this.dirX = this.newDirX;
        this.dirY = this.newDirY;
      }
      if( a[ j ][ i ]  != '-')
        a[ j ][ i ] = 'X';
      if( a[ this.oldY ][ this.oldX ] != '-' )
        a[ this.oldY ][ this.oldX ] = '0';
      this.oldX = i;
      this.oldY = j;

    }

    this.DirectionLine();

    this.x += this.dirX * this.speed;
    this.y += this.dirY * this.speed;

    this.show();
  }

  private void show(){
    strokeWeight(0);
    stroke(15);
    fill(255, 247, 130);
    circle(this.x, this.y, 25);
  }

  public void changeDir(int dirX, int dirY){
    this.newDirX = dirX;
    this.newDirY = dirY;
  }

  private void DirectionLine(){

    if( this.x % sc == 0 && this.y % sc == 0 ){
      
      this.dirLineX = (int)this.x / sc;
      this.dirLineY = (int)this.y / sc;

      if( this.dirX == 0 && this.dirY != 0){

        while( a[ this.dirLineY ][ this.dirLineX ] != '1' && a[ this.dirLineY ][ this.dirLineX ] != '-')
          this.dirLineY += this.dirY;
        this.dirLineY -= this.dirY;

      }

      if( this.dirY == 0 && this.dirX != 0 ){

        while( a[ this.dirLineY ][ this.dirLineX ] != '1' && a[ this.dirLineY ][ this.dirLineX ] != '-' )
          this.dirLineX += this.dirX;
        this.dirLineX -= this.dirX;

      }

    }

    strokeWeight(4);
    stroke(255, 247, 130);
    line(this.x, this.y, this.dirLineX * sc, this.dirLineY * sc);
    
    strokeWeight(0);
    fill(255, 247, 130);
    circle(this.dirLineX * sc, this.dirLineY * sc, 10);
  }

}
