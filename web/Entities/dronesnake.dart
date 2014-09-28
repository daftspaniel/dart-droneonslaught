part of badguys;

class DroneSnake {
  
  String Name = "Snake";
  num X = 0;
  num Y = 0;
  num hlimit = 0;
  int _width;
  int _height;

  ImageElement image;
  Rectangle rect;
  num vMove = 0;
  num hMove = -1;
  num scoreValue = 200;
  num Damage = 102;
  num hitsToDie = 10;
  num reload = 0;
  bool firing = false;
  num targetvert = -1;
  
  bool CanFire = false;
  List Tail = [];
  bool Alive = true;
  
  DroneSnake(this.X, this.Y, this.image){
    
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
