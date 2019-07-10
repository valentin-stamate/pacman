function PacMan(){
  this.x = 7*20 - 14;
  this.y = 12*20 - 14;
  this.speed = 1;
  this.direction_x = -1;
  this.direction_y = 0;
  this.direct_x = 0;
  this.direct_y = 0;
  this.PacManSize = 30;

  this.update = function(){
    let i = this.x + 14;
    let j = this.y + 14;

    if( i % 20 == 0 && j % 20 == 0 ){
      
      this.direction_x = this.direct_x;
      this.direction_y = this.direct_y;
    }
    this.x += this.direction_x * this.speed;
    this.y += this.direction_y * this.speed;
  }

  this.show = function(){
    strokeWeight(0);
    fill('#fff782');
    translate(this.PacManSize / 2, this.PacManSize / 2);
    circle(this.x - 10, this.y - 10, this.PacManSize);

  }

}