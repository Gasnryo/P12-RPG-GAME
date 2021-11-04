//Grayson Lilly
//Date: Oct 20, 2021
//1-4

//Classes
AnimatedGIF introGif;
Button introButton;
Hero myHero;
ArrayList<GameObject> myObjects;
ArrayList<DarknessCell> darkness;

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


//Image/Art import
//Characters
//Knight
boolean KR; //KR = KnightRight variable, if true knight faces right, if false knight faces left
PImage KnightRight;
PImage KnightLeft;
//Map
PImage Wall1;
PImage Floor1;

//Functional Variables

//Mouse Variables
boolean mouseReleased;
boolean wasPressed;

//Keyboard Variables
boolean w, s, a, d, space;

//Door Size
float doorSize;

//Map
PImage map;
color northRoom, eastRoom, southRoom, westRoom;

void setup() {
  //Basic Setup
  //size(800, 600, FX2D);
  fullScreen(FX2D);
  mode = intro;



  //Decorative Setup

  //Alignments
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);

  //Font
  namefont = createFont("Megatech.otf", 100);

  //load images
  //Map
  map = loadImage("map.png");
  Floor1 = loadImage("StoneBrick.png");
  Wall1 = loadImage("StoneBrickWall.png");

  //Characters
  //Knight
  KR = true;
  KnightRight = loadImage("Sprites/KnightRight.png");
  KnightLeft = loadImage("Sprites/KnightLeft.png");

  //Functional Setup

  doorSize = height/8;
  
  //Classes
  myObjects = new ArrayList<GameObject>(1000);
  introButton = new Button("START", width/2, height*0.6, 200, 100, red, black);
  introGif = new AnimatedGIF(38, "IntroGif/frame_", "_delay-0.07s.png", width/2, height/2, width, height, 8);
  myHero = new Hero();
  myObjects.add(myHero);
  

  //Darkness
  darkness = new ArrayList<DarknessCell>(1000);
  float size = 10;
  float x = size/2, y = size/2;
  //darkness.add(new DarknessCell(100, 100, size));
  //darkness.add(new DarknessCell(400, 100, size));
  while (y < height) {
    darkness.add(new DarknessCell(x, y, size));
    x=x+size;
    if (x >= width+1) {
      y = y+size;
      x = size/2;
    }
    //y = y+200;
  }
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
