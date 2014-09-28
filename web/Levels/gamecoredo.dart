part of levels;

// Game Displaye Core
class GameCoreDO{
  
  num Step = 0;
  num Current = 0;
  String Text = "Approaching...";  
  
  ImageElement bulletimage = new ImageElement(src:"Img/bullet.png");
  ImageElement badbulletimage = new ImageElement(src:"Img/badbullet.png");
  ImageElement crateImage = new ImageElement(src:"Img/crate.png");
  ImageElement wingImage = new ImageElement(src:"Img/shortwing1.png");
  ImageElement playerImage = new ImageElement(src:"Img/newplayer0.png");

  List<ImageElement> droneImages = [new ImageElement(src:"Img/drone1.png"),new ImageElement(src:"Img/drone2.png"),new ImageElement(src:"Img/drone3.png")];
  List<ImageElement> shieldBoostImages = [new ImageElement(src:"Img/shieldb0.png"), new ImageElement(src:"Img/shieldb1.png"),new ImageElement(src:"Img/shieldb2.png"), new ImageElement(src:"Img/shieldb3.png")];
  List<ImageElement> towerImages  = [new ImageElement(src:"Img/tower0.png"), new ImageElement(src:"Img/tower1.png"), new ImageElement(src:"Img/tower2.png") ];

  List<ImageElement> snakeImages  = [new ImageElement(src:"Img/snake0.png"), new ImageElement(src:"Img/snake1.png"), new ImageElement(src:"Img/snake2.png")];
  
  List<ImageElement> backgroundImages = [new ImageElement(src:"Img/Borders/lava.png"), new ImageElement(src:"Img/Borders/grille.png"), new ImageElement(src:"Img/Borders/iceb.png"), new ImageElement(src:"Img/Borders/marmalade.png"), new ImageElement(src:"Img/Borders/endzone.png")];
  
  PlayerShip player;  
  CanvasRenderingContext2D gameCanvas;
  
  GameRecord scorePane = new GameRecord();

  List GoodBullets = [];
  List BadBullets = [];
  List BadGuys = [];
  List Explosions = [];
  List Bonuses = [];

  Starfield s1;
  Starfield s2;
  Starfield s3;
  
  CaveBorder lcb;
  GameCoreDO(this.gameCanvas){
  
    player = new PlayerShip(x:0, y:240, image:playerImage);
    lcb = new CaveBorder(0,0, backgroundImages);
  }
  
  void createStarfield() {
    s1 = new Starfield(0,34,640,400,12, -2, gameCanvas);
    s2 = new Starfield(0,34,640,400,8, -3, gameCanvas);
    s3 = new Starfield(0,34,640,400,4, -4, gameCanvas);
  } 

  void add_GoodBullet()
  {
    GoodBullet newbullet = new GoodBullet(bulletimage, player.gunX, player.gunY);
    GoodBullets.add(newbullet);
    newbullet.hmove = 8;
  }
  
  DroneShip add_DroneShip(int X, int Y)
  {
    DroneShip ds = new DroneShip(X, Y, droneImages);
    BadGuys.add( ds );
    return ds;
  }

  DroneCrate add_DroneCrate(num X, num Y)
  {
    DroneCrate ds = new DroneCrate(X, Y, crateImage);
    BadGuys.add( ds );
    return ds;
  }
 
  DroneWing add_DroneWing(num X, num Y)
  {
    DroneWing ds = new DroneWing(X, Y, wingImage);
    ds.targetRect = player.rect;
    ds.Retarget();
    print(player.rect);
    BadGuys.add( ds );
    ds.gc = this;
    return ds;
  }
  
  DroneTower add_DroneTower(num X, num Y)
  {
    DroneTower ds = new DroneTower(X, Y, towerImages);
    BadGuys.add( ds );
    ds.gc = this;
    return ds;
  }
  
  DroneWing add_DroneHomingShip(num X, num Y)
  {
     DroneWing ds = new DroneWing(X, Y, wingImage);
     ds.targetvert = player.rect.top + 16;
     BadGuys.add( ds );
     return ds;
  }
  

  DroneSnake add_DroneSnake(num X, num Y) 
  {

    DroneSnake dsh = new DroneSnake(X, Y, snakeImages[0]);
    dsh.CanFire = true;
    BadGuys.add( dsh );
    
    DroneSnake ds = new DroneSnake(X + 32, Y, snakeImages[1]);
    ds.hlimit += 32;
    BadGuys.add( ds );
    dsh.Tail.add(ds);
    
    ds = new DroneSnake(X + 64, Y, snakeImages[1]);
    ds.hlimit += 64;
    BadGuys.add( ds );
    dsh.Tail.add(ds);
    
    ds = new DroneSnake(X + 96, Y, snakeImages[2]);
    ds.hlimit += 96;
    BadGuys.add( ds );
    dsh.Tail.add(ds);
    
  }
  
  BadBullet add_BadBullet(num X, num Y)
  {
    BadBullet newbullet = new BadBullet(badbulletimage, X, Y);
    BadBullets.add(newbullet);
    return newbullet;
  }
 
  void add_Explosion(num X, num Y, num Width)
  {
    Explosions.add(new Explosion(X, Y, Width ));
  }
  
  
  ShieldBoost add_ShieldBoo(num X, num Y)
  {
    ShieldBoost sb =  new ShieldBoost(X, Y, shieldBoostImages);
    Bonuses.add(sb);
    return sb;
  }

  void add_ShieldBoost()
  {
    Text = "50% Shield Boost - Get It!";
        
    // Special Bonus
    List droneshield = [];
    droneshield.add(new dPoint(640, 208));
    droneshield.add(new dPoint(672, 160));
    droneshield.add(new dPoint(672, 256));
    droneshield.add(new dPoint(672, 160));
    droneshield.add(new dPoint(704, 208));

    for(dPoint p in droneshield){
      DroneShip ds = add_DroneShip(p.x, p.y);
      ds.hMove = -1;
    }
    var sb = add_ShieldBoo( 676, 212);
    sb.Health = 50;
    sb.hMove = -1;
  }
  
  void add_CrateHill(peak)
  {
    int m = 0;
    int mx = 0;
    int my = 0;
    
    for (int x=0;x<peak;x++){
      m = (32*x);
      mx = 640 + m;
      my = 384 - m;
      add_DroneCrate( mx, my );
    }
    
    mx -= 32;
    my -= 32;
    
    for (int x=0;x<peak;x++){
      mx += 32;
      my += 32;
      add_DroneCrate( mx, my );
    }
  }
 
  void add_CrateUpHill(peak)
  {
    int m = 0;
    int mx = 0;
    int my = 0;
    
    for (int x=0;x<peak;x++){
      m = (32*x);
      mx = 640 + m;
      my = 384 - m;
      add_DroneCrate( mx, 416 - my );
    }
    
    mx -= 32;
    my -= 32;
    
    for (int x=0;x<peak;x++){
      mx += 32;
      my += 32;
      add_DroneCrate( mx, 416 - my );
    }
    
  }
 
  
  void Update()
  {
    s1.Update();
    s2.Update();
    s3.Update();
    player.Update();
    lcb.index = Current;
    lcb.Update();
    
    if (player.fire==1 && player.fired==1 && GoodBullets.length<9)
    {
      add_GoodBullet();
    } 

    for(var gbullet in GoodBullets)
    {
      gbullet.Update();
    }

    for(var bbullet in BadBullets)
    {
      bbullet.Update();
    }    
    
    for(var bg in BadGuys)
    {
      bg.Update();
    }
    
    for(var ep in Explosions)
    {
      ep.Update();
    }

    for(var bon in Bonuses)
    {
      bon.Update();
    }
    
    Rectangle r1 = null;
    Rectangle r2 = null;
    
    // Player Bullet hits a bad guy.
    for(var gbullet in GoodBullets)
    {
      r1 = gbullet.rect;
      r2 = null;
      
      for(var bg in BadGuys)
      {
        r2 = bg.rect;
        
        if (r1.intersects(r2)==true)
        {
          bg.hitsToDie -= 1;
              
          if (bg.hitsToDie < 1)
          {
            bg.Alive = false;
            add_Explosion(bg.X, bg.Y, bg.image.width);
            player.Score += bg.scoreValue;
            scorePane.updateScore(bg.scoreValue);
          }
          
          gbullet.Alive = false;
        }
      }
    }

    // Player hits a bad guy.
    r1 = player.rect;
    r2 = null;
      
    for(var bg in BadGuys)
    {
      r2 = bg.rect;
      
      if (r1.intersects(r2)==true)
      {
        bg.Alive = false;
        add_Explosion(r2.left, r2.top, r2.width);
        player.Health -= bg.Damage;
        scorePane.updateHealth(player.Health);
        //print("Health down to  ${player.Health}");
      }
    }
    
    for(var bo in Bonuses){
      r2 = bo.rect;
      if (r1.intersects(r2)==true)
      {
        bo.Alive = false;
        player.Health += bo.Health;
        scorePane.updateHealth(player.Health);
        //print("Health up to  ${player.Health}");
      }
    }
    
    BadBullets.removeWhere((b) => b.Alive==false);
    GoodBullets.removeWhere((b) => b.Alive==false);
    BadGuys.removeWhere((b) => b.Alive==false);
    Explosions.removeWhere((b) => b.Alive==false);
    Bonuses.removeWhere((b) => b.Alive==false);
    
    Step ++;
  }
  
  void Draw()
  {
    gameCanvas.fillStyle = "#000000";
    gameCanvas.fillRect(0,32, 640, 384);
   
    // Drawing Code
    //-----------------------------------------------
    s1.Draw();
    s2.Draw();
    s3.Draw();
    
    lcb.Draw(gameCanvas);
    
    if (Text.length>0) DrawOverLay();
    
    for(GoodBullet gbullet in GoodBullets)
    {
      gameCanvas.drawImage(gbullet.image, gbullet.X, gbullet.Y);
    }

    for(var bg in BadGuys)
    {
      gameCanvas.drawImage(bg.image, bg.X, bg.Y);
    }  

    
    for(BadBullet bbullet in BadBullets)
    {
      gameCanvas.drawImage(bbullet.image, bbullet.X, bbullet.Y);
    }
    
    for (var exp in Explosions)
    {
      exp.Draw(gameCanvas);
    }
    
    for (var bon in Bonuses)
    {
      gameCanvas.drawImage(bon.image, bon.X, bon.Y);
    }
    
    scorePane.Draw(gameCanvas);
    
    // Finally draw the good guy!
    gameCanvas.drawImage(player.image, player.x, player.y);

  }  


  void DrawOverLay()
  {
    gameCanvas.fillStyle = "blue";
    gameCanvas.font = "bold 16px Arial";
    num step = Step;
    gameCanvas.fillText(Text + " $step", 100, 100);
  }
  
}

