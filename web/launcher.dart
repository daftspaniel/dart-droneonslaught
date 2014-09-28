import 'dart:html';
import 'dart:async';
import 'Levels/levels.dart';

GameCoreDO gcore = null;

Levels LevelGen = new Levels();

GameLogicUpdate(Timer t){
  
  //if (gcore!=null){ 
    gcore.Update();
    LevelGen.Progress();
  //}
  //var now = new DateTime.now();
  //print("$now logic");
}

gameLoop(num delta) {
  
  if (gcore!=null){
      
    //gcore.Update();
    //LevelGen.Progress();  
    gcore.Draw();
  }   
  window.animationFrame.then(gameLoop);

}

void main() {
 
  CanvasElement CanvasTag = query("#Surface");
  CanvasRenderingContext2D GameCanvas = CanvasTag.getContext("2d");
  gcore = new GameCoreDO(GameCanvas);
 
  gcore.createStarfield();

  LevelGen.GC = gcore;
  
  GameCanvas.fillStyle = "#000000";
  GameCanvas.fillRect(0,0, 640, 480);
  
  Timer logup = new Timer.periodic(new Duration(milliseconds:8),  GameLogicUpdate);
  window.animationFrame.then(gameLoop);
  
  window.onKeyUp.listen( (KeyboardEvent e) { 
    
    if (e.keyCode == 38)
    {
      gcore.player.vmove = 0;
    }
    if (e.keyCode == 40)
    {
      gcore.player.vmove = 0;
    }
    if (e.keyCode == 39)
    {
      gcore.player.hmove = 0;
    }
    if (e.keyCode == 37)
    {
      gcore.player.hmove = 0;
    }
    if (e.keyCode == 83)
    {
      gcore.player.fire = 0;
    }
    
  });

  window.onKeyDown.listen( (KeyboardEvent e) { 
    
    if (e.keyCode == 38)
    {
      gcore.player.vmove = -1;
    }
    if (e.keyCode == 40)
    {
      gcore.player.vmove = 1;
    }
    if (e.keyCode == 39)
    {
      gcore.player.hmove = 1;
    }            
    if (e.keyCode == 37)
    {
      gcore.player.hmove = -1;
    }
    if (e.keyCode == 83)
    {
      gcore.player.fire = 1;
    }
  });

}
