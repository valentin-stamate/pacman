function PacMan(){
  this.x = 7*20;
  this.y = 12*20;
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
    
    if( i % 20 == 0 && j % 20 == 0 ){
      i /= 20;
      j /= 20;
      a[ i ][ j ] = 'X'; //curent location
      a[ i - this.direction_y ][ j - this.direction_x] = 0;
      if( a[ i + this.direction_y ][ j + this.direction_x ] == 1 && !this.isChanged){
        // next possible move
        this.direct_x = 0;
        this.direct_y = 0;
      }

      if( a[ i + this.direct_y ][ j + this.direct_x ] != 1 ){
        // if the next move can happen
        this.direction_x = this.direct_x;
        this.direction_y = this.direct_y;
        this.isChanged = false;
      }
      
    }
    this.x += this.direction_x * this.speed;
    this.y += this.direction_y * this.speed;
  }

  this.show = function(){
    strokeWeight(0);
    fill('#fff782');
    //translate(this.PacManSize / 2, this.PacManSize / 2);
    circle(this.x - 10, this.y - 10, this.PacManSize);

  }

}