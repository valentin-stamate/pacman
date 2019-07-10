function Destroyer(){
  this.x = 16*20;
  this.y = 15*20;
  this.speed = 1.25;// math stuff ;) , 1.25 * 16 = 20
  this.direction_x = 0;
  this.direction_y = 0;
  this.direct_x = 0;
  this.direct_y = 0;
  this.PacManSize = 30;
  this.isChanged = false;

  this.update = function(){
    let j = this.x - 20;
    let i = this.y - 20;
    
  }

  this.show = function(){
    strokeWeight(0);
    fill('#fa5555');
    //translate(this.PacManSize / 2, this.PacManSize / 2);
    circle(this.x - 10, this.y - 10, this.PacManSize);

  }

}