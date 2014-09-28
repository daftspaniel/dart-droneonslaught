part of badguys;

class DroneCrate{

  num X;
  num Y;
  int _width;
  int _height;
  
  ImageElement image;
  Rectangle rect;
  num vMove = 0;
  
  num hMove = -1;
  
  String Name  = "Crate";
  
  num scoreValue = 0;
  num Damage = 40;
  num hitsToDie = 1000;
  
  bool Alive = true;
  
  DroneCrate(this.X, this.Y, this.image){
      rect = new Rectangle(X, Y, image.width, image.height);
      _width = image.width;
      _height = image.height;
  }

  Update(){
      X += hMove;
      Y += vMove;
      if (X<-32) Alive = false;
      rect = new Rectangle(X, Y, _width, _height);
  }
}