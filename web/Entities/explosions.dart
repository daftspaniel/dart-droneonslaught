part of badguys;

class Explosion{
 
  num X,Y;
  num Width;
  num _gap = 1;
  bool Alive = true;
  Explosion(this.X, this.Y, this.Width){}
  
  Update(){_gap = _gap*2;}
  
  Draw(CanvasRenderingContext2D gameCanvas){
    
    var d = 0;
    var m = 0;
    var expColor = "";
    
    for (num l=2;l<13;l++)
    {
        m = _gap * l;
        if ( !(X - m<33) || !(Y + m>416) ){
          d += 1;
        }
        if (_gap % 1 == 0)
          expColor = "rgb(255, 0, 0)";
        else
          expColor = "rgb(0, 0, 255)";
      
        gameCanvas.fillStyle = expColor;
        num w = max(Width-l*2,5);
        num mar = X + ((Width - w)/2);
        gameCanvas.fillRect(mar, Y - m, w, 1);
        if (Y + m <440) gameCanvas.fillRect(mar, Y + m, w, 1);
    }
    
    if (d==0) Alive = false;
  }
}
//        pos = self.pos
//        width = self.width
//        d = 0
//        for l in range(2,12):
//            m = self.gap * l
//            if not pos[0]-m<33 or not pos[1]+m>416:
//                d+=1
//                if self.gap % 4 == 0:
//                    ec = (255, 0, 0)
//                else:
//                    ec = (0, 0, 255)
//                pygame.draw.line(screen, ec, (pos[0], pos[1]-m), (pos[0] + width, pos[1]-m))
//                pygame.draw.line(screen, ec, (pos[0], pos[1]+m), (pos[0] + width, pos[1]+m))
//                
//                #pygame.draw.line(screen, (255, 0, 0), (pos[0], pos[1]), (pos[0], pos[1]) )
//                #pygame.draw.line(screen, (255, 0, 0), (pos[0], pos[1]), (pos[0], pos[1]) )
//        if d==0:
//            self.Alive = False

