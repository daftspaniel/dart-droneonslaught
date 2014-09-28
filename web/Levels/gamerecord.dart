part of levels;

class GameRecord {
  
  int _level = 1;
  int _score = 0;
  int _shields = 100;
  bool _dirty = true;
  
  get Player1 => _score;

  void updateLevel(int level) {
    _level = level;
    _dirty = true;
  }
  
  void updateScore(int points) {
    _score = points;
    _dirty = true;
  }
  
  void updateHealth(int shields) {
    _shields = shields;
    _dirty = true;
  }
  
  void Draw(CanvasRenderingContext2D surface) {
    
    if (!_dirty) return;
    surface.fillStyle = "black";
    surface.fillRect(0, 448, 640, 480);
    surface.fillStyle = "green";
    surface.fillText("Level : $_level  Score $_score", 280, 467);
    surface.fillText("Shields ", 20, 467);
    print("Daasdf $_shields");
    int x = 130;
    int y = 455;
    surface.fillStyle = "white";
    surface.fillRect(x,y,100,16);

    if (_shields>0)
    {
      if (_shields<25)
        surface.fillStyle = "red";
      else
        surface.fillStyle = "rgb(255, 233, 127)";
      
      surface.fillRect(x,y,_shields,16);
      
      //surface.fillStyle = "white";
      //surface.fillRect(x,y,100,16);
    }
    
    _dirty = false;
  }
  
}