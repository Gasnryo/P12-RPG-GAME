//Grayson Lilly
//Date: Oct 20, 2021
//1-4

//settings and values

////Hero
int HERO_HP = 50;

float HERO_SIZE;
float HERO_SPEED;

//Enemies
final int ENEMY_HP = 100;

final int FOLLOWER_HP = 100;

//Weapons
final int WEAPON_SNIPER_THRESHOLD = 100;
final int WEAPON_SNIPER_SPEED = 20;

final int WEAPON_AUTOPISTOL_THRESHOLD = 10;
final int WEAPON_AUTOPISTOL_SPEED = 5;

final int WEAPON_SHOTGUN_THRESHOLD = 75;
final int WEAPON_SHOTGUN_SPEED = 5;
final int WEAPON_SHOTGUN_BULLETCOUNT = 15;

int BULLET_SIZE;



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
color HLYellow  = #CEF255;
color pink   = #F76DDC;
color yellow = #FFF387;
color brown  = #50310B;
color black  = #000000;
color white  = #FFFFFF;
color gray   = #5A5A5A;
color green = #23B410;
//Font
PFont namefont;


//Image/Art import
//Characters
//Knight
boolean KR; //KR = KnightRight variable, if true knight faces right, if false knight faces left
PImage KnightRight;
PImage KnightLeft;
//Weapons
PImage Bolt;
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

  //Settings (Height Involved)
  HERO_SPEED = height/200;
  HERO_SIZE  = height/8;
  
  BULLET_SIZE = height/77;

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

  //Weapons
  //Crossbow Bolt
  Bolt = loadImage("Sprites/CrossbowBolt.png");

  //Functional Setup

  doorSize = height/8;

  //Classes
  myObjects = new ArrayList<GameObject>(1000);
  myHero = new Hero();
  myObjects.add(myHero);
  introButton = new Button("START", width/2, height*0.6, 200, 100, red, black);
  introGif = new AnimatedGIF(38, "IntroGif/frame_", "_delay-0.07s.png", width/2, height/2, width, height, 8);


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
  
  //loading enemies
  x = 0;
  y = 0;
  while (y < map.height) {
   color roomColor = map.get((int)x, (int)y);
   
   if (roomColor == blue) {
     myObjects.add(new Enemy((int)x, (int)y));
   }
   if (roomColor == green) {
     myObjects.add(new Follower((int)x, (int)y));
   }
   
    x++;
    if (x == map.width) {
      x = 0;
      y++;
      
    }
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
