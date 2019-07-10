let gameBoard;
let url = 'https://i.postimg.cc/j5Q93N5T/Pacman-Board.png';
let Pacman;
function setup(){
  let canvas = createCanvas(560, 620);
  canvas.parent('screen');
  background(15);
  frameRate(60);
  gameBoard = loadImage(url, 'png');
  Pacman = new PacMan(); 
}

function draw(){
  background(15);
  image(gameBoard, 0, 0, width, height);
  Pacman.update();
  Pacman.show();
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
  
}
//...admiterea my frind, facultatea

//figure out how to import the array into the game, you are a preogrammer(almost), yo'll figure out
//to do : Finish This after 'admitere, UNIBUC?, UAIC?'