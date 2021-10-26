import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//Grayson Lilly
//Date: 
//

//Classes
Button introButton;
Hero myHero;
ArrayList<GameObject> myObjects;

//mode framework
int mode;

final int intro = 0;
final int game = 1;
final int gameover = 2;
final int pause = 3;

  //Decorative Variables

//Colors
color red    = #640507;
color dred   = #3E0203;
color blue   = #28E7ED;
color green  = #CEF255;
color pink   = #F76DDC;
color yellow = #FFF387;
color brown  = #50310B;
color black  = #000000;
color white  = #FFFFFF;
color gray   = #5A5A5A;

//Font
PFont namefont;

  //Functional Variables

//Mouse Variables
boolean mouseReleased;
boolean wasPressed;

//Keyboard Variables
boolean w, s, a, d;

//Map
PImage map;
color northRoom, eastRoom, southRoom, westRoom;

void setup() {
  //Basic Setup
  size(800, 600, FX2D);
  mode = intro;
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);

      //Decorative Setup

  //Font
  namefont = createFont("Megatech.otf", 100);
  
  //load images
  map = loadImage("map.png");
  
      //Functional Setup

  //Classes
  myObjects = new ArrayList<GameObject>(1000);
  introButton = new Button("START", width/2, height*0.6, 200, 100, red, black);
  myHero = new Hero();
  myObjects.add(myHero);
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
