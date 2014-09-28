part of badguys;

class DroneShip{

  num X;
  num Y;
  
  ImageElement image;
  Rectangle rect;
  num vMove = 0;
  num hMove = -4;
  
  String Name  = "Ship";
  
  num scoreValue = 10;
  num Damage = 20;
  num hitsToDie = 1;
  List shipimgs = null;
  num _shipswap = 0;
  
  bool Alive = true;
  Random _rng;
  
  DroneShip(this.X, this.Y, this.shipimgs){

      image = shipimgs[0];
      rect = new Rectangle(X, Y, image.width, image.height);
      _rng = new Random((new DateTime.now()).millisecondsSinceEpoch);
  }

  Update(){
      X += hMove;
      Y += vMove;
      _shipswap += 1;
      if (X<-32) Alive = false;
      rect = new Rectangle(X, Y, image.width, image.height);
      
      if (_shipswap==7){
        image = shipimgs[_rng.nextInt(shipimgs.length-1)];
        _shipswap = 0;
      }

  }
}