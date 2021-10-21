//Grayson Lilly
//Date: 
//

//Classes
Button introButton;

//mode framework
int mode;

final int intro = 0;
final int game = 1;
final int gameover = 2;
final int pause = 3;

//Colors
color blue   = #28E7ED;
color green  = #CEF255;
color pink   = #F76DDC;
color yellow = #FFF387;
color black  = #000000;
color white  = #FFFFFF;

//Mouse Variables
boolean mouseReleased;
boolean wasPressed;

void setup() {
  //Basic Setup
  size(800, 600, FX2D);
  mode = intro;
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  
  //Classes
  introButton = new Button("START", width/2, height*0.6, 200, 100, blue, yellow);
}

void draw() {
  if (mode == intro) {
    intro();
  } else if (mode == game) {
    game();
  } else if (mode == gameover) {
    gameOver();
  } else if (mode == pause) {
    pause();
  } else {
    println("Error code 1: Mode = "+mode);
  }
}
