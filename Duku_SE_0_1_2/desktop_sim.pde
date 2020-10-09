class Desktop
{
  PImage windbackground;
  PImage powericon;
  PImage iexplorer;
  
  Desktop() {
    windbackground = loadImage("https://i.imgur.com/j81O75E.jpg");
    powericon = loadImage("https://i.imgur.com/jLhxSgU.png");
    iexplorer = loadImage("https://i.imgur.com/yjYsE9A.png");
  }

  void drawDesktop()
  {
    image(windbackground, 0, 0, width, height);
    noStroke();
    fill(#66F070);
    rect(0, height-50, width, 50);
    image(powericon, 10, height-50, 50, 50);
    image(iexplorer,85,height-50,50,50);
    textAlign(CENTER);
    textSize(14);
    fill(#FFFCFC);
  }
}
class Xpboot {
  PImage xpboot;
  int xpbootx=0; int xpbooty=0;

  Xpboot() {

    xpboot = loadImage("https://i.imgur.com/Fre65dl.jpg");
  }
  
  void shutdown(){
  image(xpboot, xpbootx, xpbooty, width, height);
  
  }
  /*{float ms2=frameCount*16.7;
      while(ms2+6000>ms1){
      image(xpboot, 0, 0, width, height);
      fill(255,255,255,ms2-ms1);
      rect(0,0,width,height);
       println(ms1,ms2,ms1-ms2);
    }
  }*/
}
class Iexplorer{

  PImage iexplorer2;
  float ieanchory=height-200;
  float ieanchorx=10;
  String ietext="Internet\nExplorer";
    Iexplorer(){   
      iexplorer2 = loadImage("https://i.imgur.com/yjYsE9A.png");
    }
    
    void drawie(){
    image(iexplorer2,ieanchorx,ieanchory,50,50);
    text(ietext,ieanchorx+25,ieanchory+75);
    }
    
   void move(float x, float y){
      ieanchorx=x;
      ieanchory=y;
    }
   void erase(){
      ieanchorx=900000;
      ieanchory=900000;
   }

}
