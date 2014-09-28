part of badguys;

class DroneTower{

  num X;
  num Y;
  
  ImageElement image;
  Rectangle rect;
  num vMove = 0;
  num hMove = -1;
  
  String Name  = "Tower";
  
  num scoreValue = 10;
  num Damage = 20;
  num hitsToDie = 12;
  num reload = 0;
  List towerimgs = null;
  
  bool Alive = true;
  bool Firing = false;
  Random _rng;
  var gc = null;
  
  DroneTower(this.X, this.Y, this.towerimgs){

      image = towerimgs[0];
      rect = new Rectangle(X, Y, image.width, image.height);
      _rng = new Random((new DateTime.now()).millisecondsSinceEpoch);
  }

  Update(){
      X += hMove;

      if (X<-32) Alive = false;
      rect = new Rectangle(X, Y, image.width, image.height);
      
      if (rect.left<600  &&  rect.left>550){
        image = towerimgs[1];
      } else if (rect.left<551){
        image = towerimgs[2];
        Firing = true;
      }
      
      if (Firing){
        reload += 1;
        if (reload % 10 == 0){
          var b = gc.add_BadBullet(rect.left,rect.top);
          b.vmove = b.hmove;
        }
      }
  }
  
}