//Grayson Lilly
//Date: Oct 20, 2021
//1-4

//settings and values
//dropped item shit
final int AMMO = 0;
final int HEALTH = 1;
final int GUN = 2;

//Hero
int HERO_HP = 50;

float HERO_SIZE;
float HERO_SPEED;

//Enemies
final int ENEMY_HP = 100;

int ENEMY_SIZE;


final int FOLLOWER_HP = 100;
final float FOLLOWER_SPEED = 2.5;

final int TURRET_HP = 100;
final int TURRET_TIMER = 60;

final int SPAWNER_HP = 300;

int FOLLOWER_SIZE;

//Weapons
final int WEAPON_SNIPER_THRESHOLD = 100;
final int WEAPON_SNIPER_SPEED = 20;
final int WEAPON_SNIPER_DAMAGE = 50;

final int WEAPON_AUTOPISTOL_THRESHOLD = 10;
final int WEAPON_AUTOPISTOL_SPEED = 5;
final int WEAPON_AUTOPISTOL_DAMAGE = 15;

final int WEAPON_SHOTGUN_THRESHOLD = 75;
final int WEAPON_SHOTGUN_SPEED = 5;
final int WEAPON_SHOTGUN_BULLETCOUNT = 15;
final int WEAPON_SHOTGUN_DAMAGE = 7;

int BULLET_SIZE;

int ENEMYBULLET_SIZE;

int DARKNESS_SIZE = 10;

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
color lred   = #FF0000;
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
PImage SpikeyBall;
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
  
  //Hero
  HERO_SPEED = height/200;
  HERO_SIZE  = height/8;
  
  //Enemies
  ENEMY_SIZE = height/15;
  
  FOLLOWER_SIZE = height/15;
  //Weapons
  BULLET_SIZE = height/77;
  ENEMYBULLET_SIZE = height/27;



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
  SpikeyBall = loadImage("Sprites/SpikeyBall.png");

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
  int size = DARKNESS_SIZE;
  int x = size/2, y = size/2;
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
   color roomColor = map.get(x, y);
   
   if (roomColor == blue) {
     myObjects.add(new Turret(x, y, width*0.2, height*0.2));
     myObjects.add(new Turret(x, y, width*0.8, height*0.2));
     myObjects.add(new Turret(x, y, width*0.2, height*0.8));
     myObjects.add(new Turret(x, y, width*0.8, height*0.8));
   }
   if (roomColor == green) {
     myObjects.add(new Follower(x, y, width*0.3, height/2));
     myObjects.add(new Follower(x, y, width*0.7, height/2));
   }
   if (roomColor == red) {
     myObjects.add(new Spawner(x, y, width*0.3, height/2));
     myObjects.add(new Spawner(x, y, width*0.7, height/2));
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
