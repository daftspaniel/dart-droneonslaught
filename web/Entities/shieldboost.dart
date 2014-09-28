part of badguys;

class ShieldBoost{

  num X;
  num Y;
  
  ImageElement image;
  Rectangle rect;
  num vMove = 0;
  num hMove = -4;
  
  String Name  = "Boost";
  
  num scoreValue = 10;
  num Health = 20;
 
  List shipimgs = null;
  num _shipswap = 0;
  num curImageIndex = 0; 
  bool Alive = true;
  Random _rng;
  
  ShieldBoost(this.X, this.Y, this.shipimgs){

      image = shipimgs[0];
      rect = new Rectangle(X, Y, image.width, image.height);
      _rng = new Random((new DateTime.now()).millisecondsSinceEpoch);
      _shipswap = 6; //Force image to be set on first update.
  }

  Update(){
      X += hMove;
      Y += vMove;
      _shipswap += 1;
      if (X<-32 || X>740) Alive = false;
      rect = new Rectangle(X, Y, image.width, image.height);
      
      if (_shipswap>6){
        curImageIndex++;
        if (curImageIndex==shipimgs.length) curImageIndex=0;
        image = shipimgs[curImageIndex];
        _shipswap = 0;
      }

  }
}