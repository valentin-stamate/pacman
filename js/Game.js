let gameBoard;
let url = 'https://i.postimg.cc/j5Q93N5T/Pacman-Board.png';
let Pacman;
let destroyer;

// next , the ghosts

function setup(){
  let canvas = createCanvas(28 * 20, 31 * 20);
  canvas.parent('screen');
  background(15);
  frameRate(60);

  gameBoard = loadImage(url, 'png');
  Pacman = new PacMan();
  destroyer = new Destroyer();
}

function draw(){

  background(15);
  image(gameBoard, 0, 0, width, height);
  Pacman.update();
  Pacman.show();
  destroyer.show();
  destroyer.update();
  drawCoins();

}

function drawCoins(){
  for(let i = 1; i < 30; i++){
    for(let j = 1; j < 28; j++){
      if(a[i][j] == 2){
        strokeWeight(0);
        fill('#fff782');
        circle( j * 20 + 10, i * 20 + 10, 7);
      }
    }
  }
}

function keyPressed(){
  if(keyCode == UP_ARROW){
    Pacman.direct_x = 0;
    Pacman.direct_y = -1;
  }
  else if(keyCode == RIGHT_ARROW){
    Pacman.direct_x = 1;
    Pacman.direct_y = 0;
  }
  else if(keyCode == DOWN_ARROW){
    Pacman.direct_x = 0;
    Pacman.direct_y = 1;
  }
  else if(keyCode == LEFT_ARROW){
    Pacman.direct_x = -1;
    Pacman.direct_y = 0;
  }
  Pacman.isChanged = true;
}
//...admiterea my frind, facultatea

//figure out how to import the array into the game, you are a preogrammer(almost), yo'll figure out
//to do : Finish This after 'admitere, UNIBUC?, UAIC?'