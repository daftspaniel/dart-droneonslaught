part of levels;

class Levels {

  var rendback = null;
  num ActiveBorder = 1;
  var SideScroll = true;
  GameCoreDO GC = null;
  
  Levels(){}
  
  Progress(){
    
    //Add Objects as the player progresses.
    bool hund = GC.Step % 100 == 0; // 100th step
    int m = 0;
    
    if (!hund) return;

    if (GC.Step==100)
    { 
      GC.Text = "";
      GC.add_DroneShip( 640,240 );
      GC.add_DroneShip( 640,180 );
      GC.add_DroneShip( 840,180 );
      GC.add_DroneShip( 840,240 );
      
      for (int x=0;x<4;x++)
      {
        m = (32*x);
        GC.add_DroneCrate( 640 + m, 384 - m );
        GC.add_DroneCrate( 640 + m, 32 + m );
      }
    }
    else if (GC.Step==700){
      
      GC.add_DroneWing( 640, 220 );
      GC.add_DroneShip( 640, 300 );
    }
    else if (GC.Step==900){
      
      for (int x=0;x<4;x++){
        m = (32*x);
        GC.add_DroneShip( 640, 384 - m );
        GC.add_DroneShip( 902, 64 + m );
      }
    }
    
    else if (GC.Step==1100){
      
      for (int x=0;x<10;x++){
        m = (32*x);
        GC.add_DroneCrate( 640, 64 + m );
        GC.add_DroneCrate( 1040, 64 + m );
      }
    }
    
    else if (GC.Step==1300){
      
      GC.add_DroneWing( 640, 120 );
      GC.add_DroneWing( 640, 320 );
    }
    
    else if (GC.Step==1400){
        
       GC.add_DroneWing( 640, 220 );
       GC.add_DroneWing( 640, 388 );
    }
    else if (GC.Step==2000){
      
      GC.add_ShieldBoost();
    }
    else if (GC.Step==2100){
      
      GC.Text = "";
    }
    else if (GC.Step==2300){
      
      for (int x=0;x<10;x++){
          m = (32*x);
          GC.add_DroneShip( 640, 64 + m );
      }
      GC.add_DroneWing( 840, 220 );

      for (int x=0;x<10;x++){
          m = (32*x);
          GC.add_DroneShip( 840, 64 + m );
      }
      GC.add_DroneWing( 1240, 220 );
      
      for (int x=0;x<10;x++){
          m = (32*x);
          GC.add_DroneShip( 1440, 64 + m );
       }
      
      
    }else if (GC.Step==3000){
        
      GC.Text = "Super Shooting!";
    
    }else if (GC.Step==3100){
      
      GC.Text = "Onto Level 2";
      GC.Current = 2;
      
     }else if (GC.Step==3200){
       
       GC.Text = "";
       for (int x=0;x<5;x++){
         GC.add_DroneWing( 640 + (x*100), 20 );
       }
       
     }else if (GC.Step==3600){
       
       GC.add_CrateHill(4);
       
     }else if (GC.Step==3900){
     
       GC.add_CrateHill(3);
     
     }else if (GC.Step==4000){
      
       for (int x=0;x<8;x++){
          m = (32*x);
          GC.add_DroneShip( 640, 64 + m);
       }
       
     }else if (GC.Step==4300){
        
        GC.add_DroneTower(670, 344);
        GC.add_DroneHomingShip( -40, 0);
        GC.add_DroneHomingShip( -140, 400);
  
        GC.add_DroneWing( 710, 250 );
        
     }else if (GC.Step==4500){        

       GC.add_CrateHill(8);
        
     }else if (GC.Step==5200){

       GC.add_DroneWing( 640, 120);
       GC.add_DroneWing( 640, 220);
       GC.add_DroneWing( 640, 320);

       GC.add_DroneWing( 840, 120);
       GC.add_DroneWing( 840, 220);
       GC.add_DroneWing( 840, 320);
       
       GC.add_DroneWing( 1040, 120);
       GC.add_DroneWing( 1040, 220);
       GC.add_DroneWing( 1040, 320);
              
     } else if (GC.Step==5600){
      
        GC.add_DroneTower(670, 344);
        GC.add_DroneTower(720, 344);
        GC.add_DroneTower(770, 344);
        GC.add_DroneTower(820, 344);
       
     } else if (GC.Step==6000){
        
       GC.add_ShieldBoost();
     
     } else if (GC.Step==6100){
            
       GC.Text = "";
     
     } else if (GC.Step==6400){
       
       GC.Text = "Born To Zap!";
     
     } else if (GC.Step==6500){
       
       GC.Text = "Onto Level 3";
       GC.Current = 3;
       
     } else if (GC.Step==6600){
        
       GC.Text = "";
            
       for (int x=0;x<11;x++){
         m = (32*x);
         GC.add_DroneCrate( 640, 64 + m );
       }
       
       for (int x=0;x<11;x++){
        m = (32*x);
        GC.add_DroneCrate( 1040, 64 + m );
       }
     } else if (GC.Step==7500){
       
       GC.add_DroneSnake( 640,230 );
       GC.add_CrateUpHill(4);
       
     } else if (GC.Step==8000){
     
       //GC.add_DroneWalker( 640, 384 );
       //GC.add_DroneWalker( 840, 384 );
       //GC.add_DroneWalker( 1040, 384 );
       //GC.add_DroneWalker( 1240, 384 );
     }
         
  }//

  
}