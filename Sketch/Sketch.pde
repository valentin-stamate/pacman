import java.util.List;
import java.util.ArrayList;

PImage img, c;
int sc = 20, rows, cols;

Destroyer destroyer;
Tricky tricky;
Pinky pinky;

PacMan pacman;
List< List<Cell> > array;
List<Cell> path = new ArrayList<Cell>();

void setup() {
  size( 560 , 620 );
  background( 15 );
  frameRate( 60 );

  img = loadImage("PacmanBoard.png");
  image(img, 0, 0);
  c = get();

  rows = height / sc;
  cols = width / sc;

  array = new ArrayList< List<Cell> >();
  for(int i = 0; i < rows; i ++){
    array.add( new ArrayList<Cell>() );
    for(int j = 0; j < cols; j ++){
      array.get(i).add( new Cell(i, j) );
      if( a[i][j] == '1' )
        array.get(i).get(j).isWall = true;
    }
  }

  pacman = new PacMan();

  destroyer = new Destroyer(20, 20);
  destroyer.SetColor(239, 106, 106);

  tricky = new Tricky(13 * sc, 11 * sc);
  tricky.SetColor(87, 242, 176);

  pinky = new Pinky(15 * sc, 11 * sc);
  pinky.SetColor(164, 53, 229);

  rectMode(RADIUS);
}

void draw() {
  background( 15 );
  image(c, 0, 0);
  translate(sc / 2, sc / 2);
  destroyer.drawPath();
  tricky.drawPath();
  pinky.drawPath();
  drawCoins();

  pacman.update();

  if(pacman.isInvincible){
    if(!destroyer.isWeak && !destroyer.isRecovering && destroyer.isAffectedBy){
      destroyer.makeWeak();
    }
    if(!tricky.isWeak && !tricky.isRecovering && tricky.isAffectedBy){
      tricky.makeWeak();
    }
    if(!pinky.isWeak && !pinky.isRecovering && pinky.isAffectedBy){
      pinky.makeWeak();
    }
  } else {
    if(destroyer.isWeak){
      destroyer.makeNormal();
    }
    if(tricky.isWeak){
      tricky.makeNormal();
    }
    if(pinky.isWeak){
      pinky.makeNormal();
    }
  }

  // check collision with pacman
  if( Math.abs(pacman.x - destroyer.x) < sc + 10 && Math.abs(pacman.y - destroyer.y) < sc + 10 ) {
    if(pacman.isInvincible && destroyer.isAffectedBy){
      destroyer.retreat();
    } else {
      print("Game OverDEST");
      noLoop();
    }
  }
  if( Math.abs(pacman.x - tricky.x) < sc + 10 && Math.abs(pacman.y - tricky.y) < sc + 10 ) {
    if(pacman.isInvincible && tricky.isAffectedBy){
      tricky.retreat();
    } else {
      print("Game OverTRY");
      noLoop();
    }
  }
  if( Math.abs(pacman.x - pinky.x) < sc + 10 && Math.abs(pacman.y - pinky.y) < sc + 10 ) {
    if(pacman.isInvincible && pinky.isAffectedBy){
      pinky.retreat();
    } else {
      print("Game OverPINK");
      noLoop();
    }
  }

  destroyer.search();
  tricky.search();
  pinky.search();
}

void drawCoins(){
  strokeWeight(0);
  stroke(15);
  fill(255, 246, 107);
  int score = 0;
  for(int i = 1; i < 30; i++){
    for(int j = 1; j < 28; j++){
      if(a[ i ][ j ] == '2'){
        circle( j * sc, i * sc, 8);
        score++;
      } else
      if(a[i][j] == '3'){
        circle(j * sc, i * sc, 12);
        score++;
      }
    }
  }
  if(score == 0){
    println("");
    print("You win");
    noLoop();
  }
}

void showMatrix(){
  for(int i = 0; i < 31; i++){
    for(int j = 0; j < 28; j++){
      boolean b = array.get(i).get(j).isWall;
      if(b)
        print(1);
      else print(0);
    }println();
  }
}

void keyPressed(){

  if(keyCode == UP)
    pacman.changeDir(0, -1);

  else if(keyCode == RIGHT)
    pacman.changeDir(1, 0);

  else if(keyCode == DOWN)
    pacman.changeDir(0, 1);

  else if(keyCode == LEFT)
    pacman.changeDir(-1, 0);

}
