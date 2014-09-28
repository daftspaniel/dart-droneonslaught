part of badguys;

/***
 * DroneWing's are nasty bad guys that fire shots and track the player's height.
 */
class DroneWing{

  num X;
  num Y;
  num _width;
  num _height;
  
  ImageElement image;
  Rectangle rect;
  
  num vMove = 0;
  num hMove = -3;
  num _reload = 0;
  String Name  = "Wing";
  
  num scoreValue = 10;
  num Damage = 20;
  num hitsToDie = 1;
  Rectangle targetRect = null;
  num targetvert = -1;
  bool Alive = true;
  bool firing = false;
  var gc = null;
  
  DroneWing(this.X, this.Y, this.image){
      rect = new Rectangle(X, Y, image.width, image.height);
      _width = image.width;
      _height = image.height;
  }

  Update(){
    
    // Firing
    if (firing){
      _reload += 1;
      if (_reload % 40 == 0){
        gc.add_BadBullet(rect.left,rect.top);
        //b = z.add_BadBullet(rect.topleft);
        //print("pow!");
        if (targetvert>-1) Retarget();
      }
    }
    
    if (targetvert>-1){
      
      if ((targetvert-rect.top).abs()>10){
        
        if (targetvert>rect.top){
          vMove = 8;
        }else{
          vMove = -8;
        }
      }
      else
        vMove = 0;
      print("vMove $vMove");
      if ((rect.left<0 && hMove<0) || (rect.left>666 && hMove>0)){ 
          hMove *= -1;
          Retarget();
      }
      
    } else {
      vMove = 0;
    }
  
    X += hMove;
    Y += vMove;
    
    if (X<-32) Alive = false;
    rect = new Rectangle(X, Y, _width, _height);
    if (rect.left<630)
      firing = true;
    
   }
  
  Retarget(){
    if (targetRect!=null)
      targetvert = targetRect.top+16;
  }
}