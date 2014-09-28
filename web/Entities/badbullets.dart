part of badguys;

/***
 * 
 */
class BadBullet {
  
  num X;
  num Y;
  
  ImageElement image;
  Rectangle rect;
  num vmove = 0;
  num hmove = -8;
  bool Alive = true;
  
  BadBullet(this.image, this.X, this.Y){
    rect = new Rectangle(X, Y, image.width, image.height);
  }
  
  Update(){
    // Movement
    if (this.vmove!=0)
      Y += this.vmove;
    if (this.hmove!=0)
      X += this.hmove;
    
    if (X>640 || X<0) Alive = false;
    
    rect = new Rectangle(X, Y, image.width, image.height);
  }
  
}