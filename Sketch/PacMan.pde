class PacManPlayer{
  public float x = 12 * sc, y = 23 * sc;
  private int dirLineX = 12, dirLineY = 23;
  private int dirX = -1, dirY = 0;
  private int newDirX, newDirY;
  private float speed = 2.5; // math stuff ;) , 2.5 * 8 = sc
  private int oldX = 12, oldY = 23;
  public int i, j;
  public Cell oldPosition = array.get(23).get(12);

  public void update(){
    if( a[ this.oldY ][ this.oldX ] != '-' )
      a[ this.oldY ][ this.oldX ] = 'X';

    if(frameCount % 100 == 0){
      // update the old position every 1 second for Tricky
      this.oldPosition = array.get(j).get(i);
    }

    if( this.x % 20 == 0 && this.y % 20 == 0 ){

      this.i = (int)this.x / sc;
      this.j = (int)this.y / sc;


      if( a[ this.j ][ this.i ] == '-' && this.i == 0){
        this.x = 27 * sc;
        this.i = 27;
      } else if( a[ this.j ][ this.i ] == '-' && this.i == 27){
        this.x = 0;
        this.i = 0;
      }

      int newPositionX = this.i + this.newDirX;
      int newPositionY = this.j + this.newDirY;

      int nextPositionX = this.i + this.dirX;
      int nextPositionY = this.j + this.dirY;

      if( a[ nextPositionY ][ nextPositionX ] == '1'){
        this.dirX = 0;
        this.dirY = 0;
      }

      if( a[ newPositionY ][ newPositionX ] != '1' ){
        this.dirX = this.newDirX;
        this.dirY = this.newDirY;
      }
      if( a[ this.j ][ this.i ]  != '-')
        a[ this.j ][ this.i ] = 'X';
      if( a[ this.oldY ][ this.oldX ] != '-' )
        a[ this.oldY ][ this.oldX ] = '0';
      this.oldX = this.i;
      this.oldY = this.j;

    }

    this.x += this.dirX * this.speed;
    this.y += this.dirY * this.speed;

    this.show();
  }

  private void show(){
    noStroke();
    fill(255, 247, 130);
    circle(this.x, this.y, 25);
  }

  public void changeDir(int dirX, int dirY){
    this.newDirX = dirX;
    this.newDirY = dirY;
  }

}
