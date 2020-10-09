import processing.sound.*;
import java.awt.event.KeyEvent;

MultilineTextBox textBox;
Desktop desktopB;
Xpboot xpboot;
Iexplorer iexplorerB;
Searchengine se;
Luckywheel wheel;
Error error;

float ms1;
float ms2;
float ieanchorxm=10;
float ieanchorym=height-200;
boolean draggable=true;
boolean deskrunning=true;
boolean serunning=false;
boolean whrunning=false;
boolean spinning=false;
boolean errorfix=false;
int k=0;
PImage fakedesktop=loadImage("https://i.imgur.com/w9wN9SS.png");
PImage wheel1=loadImage("https://i.imgur.com/DucnamN.png");
int dice=0;
boolean emergenceexit=false;

void setup()
{
  size(1280, 720);
  desktopB = new Desktop();
  xpboot= new Xpboot();
  iexplorerB=new Iexplorer();
  se= new Searchengine();
  textBox = new MultilineTextBox("Type Here", (width-360)/2, height/2, 360, 20);
  wheel= new Luckywheel();
  error=new Error();


  desktopB.drawDesktop();
  iexplorerB.drawie();
}

void draw() {

  iexplorerB.drawie();

  if (serunning==true) {
    iexplorerB.drawie();
    if(emergenceexit==false){
    textBox.display();
    textBox.update();}
    errorfix=false;
  }
  if (whrunning==true) {

    wheel.display();
    fill(#000000);
    triangle((width-50)/2, (height+300)/2, width/2, (height+250)/2, (width+50)/2, (height+300)/2);
  }
  if (spinning==true) {
    pushMatrix();
    translate(width/2, height/2-30);
    rotate(radians(frameCount));
    imageMode(CENTER);
    image(wheel1, 0, 0, 300, 300);
    popMatrix();
    imageMode(CORNER);
    if (whrunning==false && errorfix==true) {
      desktopB.drawDesktop();
      iexplorerB.drawie();
    }
  }
}

void mouseClicked() {

  println(mouseX, mouseY, mouseX-ieanchorxm, mouseX-ieanchorxm, mouseY-ieanchorym, mouseY-ieanchorym);
  SoundFile shutdownsfx;
  shutdownsfx=new SoundFile(this, "windowsxpsd.mp3");

  if (dist(mouseX, mouseY, 0, height-50)<=50) {
    shutdownsfx.play();
    xpboot.shutdown();
    iexplorerB.erase();
    serunning=false;
    println("serunning set as", serunning);
  }

  if (mouseX-ieanchorxm<=50 && mouseX-ieanchorxm>=0 && mouseY-ieanchorym<=height && mouseY-ieanchorym>=height-100 && draggable==false && k==0) {
    draggable=true;
  }

  if (mouseX>=565 && mouseX<=710 && mouseY>=480 && mouseY<=525) {
    serunning=false;
    whrunning=true;
    println("Cserunning set as", serunning);
  }

  if (mouseX<=width && mouseX>=width-90 && mouseY>=0 && mouseY<=30 && serunning==true) {
    desktopB.drawDesktop();
    iexplorerB.drawie();
    iexplorerB.move(10, height-200);
    serunning=false;
    println("B serunning set as", serunning);
  }

  if (mouseX<=width && mouseX>=width-90 && mouseY>=10 && mouseY<=40 && whrunning==true) {
    desktopB.drawDesktop();
    iexplorerB.drawie();
    iexplorerB.move(10, height-200);
    whrunning=false;
    errorfix=true;
    println("D serunning set as", whrunning);
  }
      if (mouseX<=width && mouseX>=width-90 && mouseY>=0 && mouseY<=30 && emergenceexit==true) {
    xpboot.shutdown();
  }
    if (mouseX<=width && mouseX>=width-90 && mouseY>=0 && mouseY<=30) {
    desktopB.drawDesktop();
    iexplorerB.drawie();
    iexplorerB.move(10, height-200);
  }
  if (mouseX<=720 && mouseX>=560 && mouseY>=height*3/4 && mouseY<=590 && whrunning==true && spinning==true) {
    spinning=false;
    println("spinning is", spinning);
  }
  if (mouseX<=720 && mouseX>=560 && mouseY>=height*3/4 && mouseY<=590 && whrunning==true && spinning==false) {
    spinning=true;
    println("spinning is", spinning);
  }
}

void mouseDragged() {

  if (draggable==true) {
    image(fakedesktop, 0, 0);
    iexplorerB.move(mouseX, mouseY);
  }

  textBox.updateDrag();
}

void mouseReleased() {

  if (draggable==true) {
    desktopB.drawDesktop();
    iexplorerB.move(mouseX, mouseY);
    draggable=false;
    desktopB.drawDesktop();
    k++;
  }

  textBox.updateRelease();
}

void keyPressed() {

  if (key=='/') {
    se.sedraw();
    iexplorerB.erase();
    serunning=true;
    println("serunning is", serunning);
  }

  if (serunning==true) {
    textBox.updateKeys();
  }
  
 if(key=='.' && serunning==true){
   
   dice=int(random(1,5));
   error.select(dice);
   emergenceexit=true;
 }
}
void mousePressed() {

  if (serunning==true) {
    textBox.updatePress();
  }
}
