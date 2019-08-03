import java.util.List;
import java.util.ArrayList;

PImage img, c;
int sc = 20, rows, cols;
Destroyer destroyer;
PacManPlayer pacman;
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

  pacman = new PacManPlayer();
  destroyer = new Destroyer(20, 20);

  rectMode(RADIUS);
}

void draw() {
  background( 15 );
  image(c, 0, 0);
  translate(sc / 2, sc / 2);

  drawPath();
  drawCoins();

  pacman.update();
  destroyer.show(200, 64, 120);
  destroyer.update();
}

void drawPath(){
  for(Cell c : path){
    c.show(200, 50, 30);
  }
}

void drawCoins(){
  for(int i = 1; i < 30; i++){
    for(int j = 1; j < 28; j++){
      if(a[ i ][ j ] == '2'){
        strokeWeight(0);
        stroke(15);
        fill(255, 246, 107);
        circle( j * sc, i * sc, 8);
      }
    }
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
