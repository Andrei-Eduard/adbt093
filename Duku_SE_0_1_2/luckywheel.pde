class Luckywheel{
    PImage wheel=loadImage("https://i.imgur.com/DucnamN.png");
    PImage backbtn=loadImage("https://i.imgur.com/h31C3LL.png");
    PImage spinbtn=loadImage("https://i.imgur.com/fBB2GZM.png");
    PImage closebtn=loadImage("https://i.imgur.com/ATLEW4F.png");
    Luckywheel(){
    
    }
    
    void display(){
      fill(#FFFFFF);
      rect(0,0,width,height-50);
      image(wheel,(width-300)/2,height/4,300,300);
      image(backbtn,10,10,40,40);
      image(closebtn,width-90,10,90,30);
      image(spinbtn,(width-160)/2,height*3/4,160,50);
    
    }
    
    void spin(){
      pushMatrix();
      rotate(radians(random(45)));
      translate(0,0);
     image(wheel,(width-300)/2,height/4,300,300);
     popMatrix();
    }

}
