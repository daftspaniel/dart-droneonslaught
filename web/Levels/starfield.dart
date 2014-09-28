part of levels;

class dPoint {
  num x;
  num y;
  dPoint(this.x, this.y);
}

class Starfield {
  
   int Speed = 0;
   int Count = 0;
   int X = 0;
   int Y = 0;
   int Width = 640;
   int Height = 480;
   
   List Stars;
   CanvasRenderingContext2D Surface;
   
   Starfield(this.X, this.Y, this.Width, this.Height, this.Count, this.Speed, this.Surface)
   {
     Stars = [];
     var now = new DateTime.now();
     var rng = new Random(now.millisecondsSinceEpoch);
     while(this.Count>Stars.length)
       Stars.add(new dPoint(rng.nextInt(Width), rng.nextInt(Height)));
   }
   
   Draw()
   {
     this.Surface.fillStyle = "#FFFFFF";
     for(var star in Stars)
     {
      this.Surface.fillRect(star.x, star.y, 1, 1);
     }
   }
   
   Update(){
     for(var star in Stars)
     {
       star.x += Speed;
       if (star.x>Width) 
         star.x = 0;
       else if (star.x<0)
         star.x = Width;
     }
   }  
   
}//