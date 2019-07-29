PImage img, c;
int sc = 20;

PacManPlayer pacman;


void setup() {
  size( 560 , 620 );
  background( 15 );
  frameRate( 60 );

  img = loadImage("PacmanBoard.png");
  image(img, 0, 0);
  c = get();

  pacman = new PacManPlayer();
}

void draw() {
  background( 15 );
  image(c, 0, 0);
  
  translate(sc / 2, sc / 2);

  drawCoins();
  pacman.update();

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
      print(a[ i ][ j ] + " ");
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
