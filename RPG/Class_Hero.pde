class Hero extends GameObject {

  float speed;
  //float KnightSize, KnightSizeHeight;
  float KnightSizeHeight;
  int immunity;
  int maxHp;
  Weapon myWeapon;
  AnimatedGIF currentAction;

  Hero() {
    super();
    speed = HERO_SPEED;
    maxHp = hp = HERO_HP;
    roomX = 1;
    roomY = 1;
    size = HERO_SIZE;
    KnightSizeHeight = size*1.4188;
    myWeapon = new RingGun();
    currentAction = manDown;
    immunity = 0;
    xp = 100;
  }

  void show() {
    currentAction.show(loc.x, loc.y, size, size);

    rectMode(CORNER);
    fill(lred);
    stroke(black);
    strokeWeight(1);
    rect(loc.x-50, loc.y+75, HERO_HP*2, 15);

    fill(green);
    stroke(black);
    strokeWeight(1);
    rect(loc.x-50, loc.y+75, hp*2, 15);
  }

  void act() {
    super.act();


    //Hero Move
    if (w) { 
      vel.y = -speed;
      currentAction = manUp;
    }
    if (a) {
      vel.x = -speed;
      currentAction = manLeft;
      KR = false;
    }
    if (s) {
      vel.y = speed;
      currentAction = manDown;
    }
    if (d) { 
      vel.x = speed;
      KR = true;
      currentAction = manRight;
    }

    if (vel.mag() > speed) vel.setMag(speed);

    //Stop when not moving
    if (!w && !s) vel.y = 0;
    if (w && s) vel.y = 0;
    if (!a && !d) vel.x = 0;
    if (a && d) vel.x = 0;

    //check exits
    //north
    if (northRoom != #FFFFFF && loc.y == height*0.1 && loc.x >= width/2-doorSize/2 && loc.x <= width/2+doorSize/2) {
      roomY--;
      loc = new PVector(width/2, height*0.9-10);
      cleanUp();
    }
    //east
    if (eastRoom != #FFFFFF && loc.x == width*0.9 && loc.y >= height/2-doorSize/2 && loc.y <= height/2+doorSize/2) {
      roomX++;
      loc = new PVector(width*0.1+10, height/2);
      cleanUp();
    }
    //south
    if (southRoom != #FFFFFF && loc.y == height*0.9 && loc.x >= width/2-doorSize/2 && loc.x <= width/2+doorSize/2) {
      roomY++;
      loc = new PVector(width/2, height*0.1+10);
      cleanUp();
    }
    //west
    if (westRoom != #FFFFFF && loc.x == width*0.1 && loc.y >= height/2-doorSize/2 && loc.y <= height/2+doorSize/2) {
      roomX--;
      loc = new PVector(width*0.9-10, height/2);
      cleanUp();
    }

    //gun
    myWeapon.update();
    if (space) myWeapon.shoot();

    //collision shit
    int i = 0;
    while (i < myObjects.size()) {
      GameObject myObj = myObjects.get(i);
      //bullet collision
      if (myObj instanceof EnemyBullet && isCollidingWith(myObj)) {
        hp = hp-10;
        myObj.hp = 0;
      }
      //enemy collision
      if (myObj instanceof Enemy && isCollidingWith(myObj) && immunity > 5) {
        hp--;
        immunity = 0;
      }
      if (myObj instanceof DroppedItem && isCollidingWith(myObj)) {
        DroppedItem item = (DroppedItem) myObj;
        if (item.type == GUN) {
          myWeapon = item.w;
          item.hp = 0;
        }

        //if (item.type == AMMO) {

        //}

        if (item.type == HEALTH) {
          hp = hp+10;
          if (hp > maxHp) {
            hp = maxHp;
          }
          item.hp = 0;
        }
      }
      i++;
    }
    immunity++;
  }//act end
  
  void cleanUp() {
   int i = 0;
   while (i < myObjects.size()) {
    GameObject obj = myObjects.get(i);
    if (obj instanceof Bullet || obj instanceof EnemyBullet) {
     if (!inRoomWith(obj)) {
      myObjects.remove(i);
      i--;
     }
    }
    i++;
   }
  }
}
