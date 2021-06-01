import java.util.List;
import java.util.ArrayList;

PImage img, c;
int sc = 20, rows, cols;

Blinky blinky;
Pinky pinky;
Inky inky;
Clyde clyde;

PacMan pacman;

List< List<Cell> > array;
List<Cell> path, food, bonusFood;

void setup() {
  size(560, 620);
  background(15);
  frameRate(60);

  img = loadImage("PacmanBoard.png");
  image(img, 0, 0);
  c = get();

  rows = height / sc;
  cols = width / sc;

  array = new ArrayList< List<Cell> >();
  path = new ArrayList<Cell>();
  food = new ArrayList<Cell>();
  bonusFood = new ArrayList<Cell>();

  for(int i = 0; i < rows; i ++){
    array.add( new ArrayList<Cell>() );
    for(int j = 0; j < cols; j ++){
      array.get(i).add( new Cell(i, j) );
      if( a[i][j] == '1' )
        array.get(i).get(j).isWall = true;
      else if(a[i][j] == '2')
        food.add( array.get(i).get(j) );
      else if(a[i][j] == '3')
        bonusFood.add( array.get(i).get(j) );
    }
  }

  pacman = new PacMan();

  blinky = new Blinky(13, 13);
  pinky = new Pinky(14, 13);
  inky = new Inky(14, 12);
  clyde = new Clyde(14, 14);

  blinky.SetColor(255, 95, 95);
  pinky.SetColor(255, 184, 255);
  inky.SetColor(0, 255, 255);
  clyde.SetColor(255, 184, 81);

  rectMode(RADIUS);
}

void draw() {
  background( 15 );
  image(c, 0, 0);
  translate(sc / 2, sc / 2);

  blinky.drawPath();
  pinky.drawPath();
  inky.drawPath();
  clyde.drawPath();

  drawCoins();

  pacman.update();

  if(pacman.isInvincible){
    if(!blinky.isWeak && !blinky.isRecovering && blinky.isAffectedBy){
      blinky.makeWeak();
    }
    if(!pinky.isWeak && !pinky.isRecovering && pinky.isAffectedBy){
      pinky.makeWeak();
    }

    if(!inky.isWeak && !inky.isRecovering && inky.isAffectedBy){
      inky.makeWeak();
    }
    if(!clyde.isWeak && !clyde.isRecovering && clyde.isAffectedBy){
      clyde.makeWeak();
    }
  } else {
    if(blinky.isWeak){
      blinky.makeNormal();
    }
    if(pinky.isWeak){
      pinky.makeNormal();
    }
    if(inky.isWeak){
      inky.makeNormal();
    }
    if(clyde.isWeak){
      clyde.makeNormal();
    }
  }

  //check collision with pacman
  if( Math.abs(pacman.x - blinky.getX()) < sc + 10 && Math.abs(pacman.y - blinky.getY()) < sc + 10 ) {
    if(pacman.isInvincible && blinky.isAffectedBy){
      blinky.retreat();
    } else {
      print("Caught By Blinky");
      noLoop();
    }
  }

  if( Math.abs(pacman.x - pinky.getX()) < sc + 10 && Math.abs(pacman.y - pinky.getY()) < sc + 10 ) {
    if(pacman.isInvincible && pinky.isAffectedBy){
      pinky.retreat();
    } else {
      print("Caught By Pinky");
      noLoop();
    }
  }

  if( Math.abs(pacman.x - inky.getX()) < sc + 10 && Math.abs(pacman.y - inky.getY()) < sc + 10 ) {
    if(pacman.isInvincible && inky.isAffectedBy){
      inky.retreat();
    } else {
      print("Caught By Inky");
      noLoop();
    }
  }
  if( Math.abs(pacman.x - clyde.getX()) < sc + 10 && Math.abs(pacman.y - clyde.getY()) < sc + 10 ) {
    if(pacman.isInvincible && clyde.isAffectedBy){
      clyde.retreat();
    } else {
      print("Caught By Clyde");
      noLoop();
    }
  }

  blinky.search();
  pinky.search();
  inky.search();
  clyde.search();
}

void drawCoins(){
  strokeWeight(0);
  stroke(15);
  fill(255, 184, 151);

  for(Cell c : food)
    circle(c.j * sc, c.i * sc, 6);
  for(Cell c : bonusFood)
   circle(c.j * sc, c.i * sc, 16);
  if(food.size() == 0 && bonusFood.size() == 0){
    println("\nYou win");
    noLoop();
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
