part of levels;

/***
 * Graphic which scrolls to border the playing area.
 */
class CaveBorder {

  num x;
  num y;
  
  num index;
  List<ImageElement> images;
  Rectangle rect;
  CanvasRenderingContext2D Surface;
  
  CaveBorder(this.x, this.y, this.images){
    index = 0;
    rect = new Rectangle(x, y, images[index].width, images[index].height);
  }
  
  Update(){
      x++;
      if (x>31) x=0;
  }
  
  Draw(CanvasRenderingContext2D surface){
    
    var image = images[index];
    for (int m=0;m<22;m++){
      surface.drawImage(image, (m*32)-x, y);
      surface.drawImage(image, (m*32)-x, 416);
    }
    
  }
    
  
}