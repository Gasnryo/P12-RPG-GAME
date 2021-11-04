class Hero extends GameObject {

  float speed, size;
  int roomX, roomY;
  float KnightSize;
  Weapon myWeapon;

  Hero() {
    super();
    //speed = 5;
    speed = height/150;
    size = 40;
    roomX = 1;
    roomY = 1;
    KnightSize = height/13;
    //myWeapon = new Weapon(15, 20);
    myWeapon = new AutoPistol();
  }

  void show() { //display character
    //fill(brown);
    //stroke(gray);
    //strokeWeight(3);
    //circle(loc.x, loc.y, size);
    imageMode(CENTER);
    image(KnightRight, loc.x, loc.y, KnightSize, KnightSize*1.3392);
    if (KR == true) {
      image(KnightRight, loc.x, loc.y, KnightSize, KnightSize*1.3392);
    } else if (KR == false) {
      image(KnightLeft, loc.x, loc.y, KnightSize, KnightSize*1.3392);
    }
  }

  void act() {
    super.act();

    //Hero Move
    if (w) vel.y = -speed;
    if (a) {
      vel.x = -speed;
      KR = false;
    }
    if (s) vel.y = speed;
    if (d) { 
      vel.x = speed;
      KR = true;
    }

    if (vel.mag() > speed) vel.setMag(speed);

    //Stop when not moving
    if (!w && !s) vel.y = 0;
    if (w && s) vel.y = 0;
    if (!a && !d) vel.x = 0;
    if (a && d) vel.x = 0;

    ////hit walls extra
    //if (loc.x < width*0.1+size/2) loc.x = width*0.1+size/2;
    //if (loc.x > width*0.9-size/2) loc.x = width*0.9-size/2;
    //if (loc.y < height*0.1+size/2) loc.y = height*0.1+size/2;
    //if (loc.y > height*0.9-size/2) loc.y = height*0.9-size/2;

    //check exits
    //north
    if (northRoom != #FFFFFF && loc.y == height*0.1 && loc.x >= width/2-doorSize/2 && loc.x <= width/2+doorSize/2) {
      roomY--;
      loc = new PVector(width/2, height*0.9-10);
    }
    //east
    if (eastRoom != #FFFFFF && loc.x == width*0.9 && loc.y >= height/2-doorSize/2 && loc.y <= height/2+doorSize/2) {
      roomX++;
      loc = new PVector(width*0.1+10, height/2);
    }
    //south
    if (southRoom != #FFFFFF && loc.y == height*0.9 && loc.x >= width/2-doorSize/2 && loc.x <= width/2+doorSize/2) {
      roomY++;
      loc = new PVector(width/2, height*0.1+10);
    }
    //west
    if (westRoom != #FFFFFF && loc.x == width*0.1 && loc.y >= height/2-doorSize/2 && loc.y <= height/2+doorSize/2) {
      roomX--;
      loc = new PVector(width*0.9-10, height/2);
    }

    myWeapon.update();
    if (space) myWeapon.shoot();
  }
}
