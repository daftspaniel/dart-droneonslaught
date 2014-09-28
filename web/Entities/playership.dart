
part of badguys;

class PlayerShip {
  
  num x;
  num y;

  ImageElement image;
  Rectangle rect;
  num vmove = 0;
  num hmove = 0;
  num fire = 0;
  num fired = 0;
  List bullets = [];
  num reload = 0;
  num Health = 100;
  num Score = 0;
  
  get gunY => y+16;
  get gunX => x+28;
  
  PlayerShip({this.x, this.y, this.image}){
    rect = new Rectangle(x, y, image.width, image.height);
  }
  
  Update(){
    
    reload += 1;
        
    // Fire!
    if (fire==1 && reload>10){
      fired = 1;
      reload = 0;
    }else{
      fired = 0;
    }
    num ox=y;
    num oy=y;
    // Movement
    if (this.vmove!=0)
      y += this.vmove * 4;
    if (this.hmove!=0)
      x += this.hmove * 4;
    
    if (y<32) y = 32;
    else if (y>384) y=384;
    
    if (x<0) x=0;
    else if (x>608) x=608;
    
    rect = new Rectangle(x, y, image.width-1, image.height-1);
  }
  
}