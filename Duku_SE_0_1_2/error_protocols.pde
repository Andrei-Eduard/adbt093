class Error{
PImage error1=loadImage("https://i.imgur.com/VjBvxnV.png");
PImage error2=loadImage("https://i.imgur.com/Bl1TV10.png");
PImage error3=loadImage("https://i.imgur.com/xij9oID.png");
PImage error4=loadImage("https://i.imgur.com/k4TvNN6.png");
Error(){
}

void select(int x){
if (x==1){
  fill(#F5F2F2);
  rect(0,50,width,height-100);
  image(error1,(width-400)/2,height/2,400,250);
}
if (x==2){
  fill(#F5F2F2);
  rect(0,50,width,height-100);
  image(error2,(width-400)/2,height/2,400,250);
}
if (x==3){
  fill(#F5F2F2);
  rect(0,50,width,height-100);
  image(error3,(width-400)/2,height/2,400,250);
}
if (x==4){
  fill(#F5F2F2);
  rect(0,50,width,height-100);
  image(error4,0,50,width,height-100);}
if (x==5){
  xpboot.shutdown();
}

}}
