class Hero extends GameObject {

  float speed;
  //float KnightSize, KnightSizeHeight;
  float KnightSizeHeight;
  int immunity;
  Weapon myWeapon;

  Hero() {
    super();
    speed = HERO_SPEED;
    hp = HERO_HP;
    roomX = 1;
    roomY = 1;
    //KnightSize = HERO_SIZE;
    size = HERO_SIZE;
    //KnightSizeHeight = HERO_SIZE*1.4188;
    KnightSizeHeight = size*1.4188;
    myWeapon = new Shotgun();
    immunity = 0;
  }

  void show() { //display character

    //Flip knight sprite
    imageMode(CENTER);
    if (KR == true) {
      image(KnightRight, loc.x, loc.y, size, KnightSizeHeight);
    } else if (KR == false) {
      image(KnightLeft, loc.x, loc.y, size, KnightSizeHeight);
    }
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


    //Enemy Collisions
    //int i = 0;
    //while (i < myObjects.size()) {//===
    //  GameObject myObj = myObjects.get(i);
    //  if (myObj instanceof Enemy || myObj instanceof EnemyBullet) {//====
    //    if (roomX == myObj.roomX && roomY == myObj.roomY) {
    //      if (dist(loc.x, loc.y, myObj.loc.x, myObj.loc.y) <= size/2+myObj.size/2 && immunity > 5) {//=====
    //        if (myObj instanceof Enemy) {
    //          hp = hp-1;
    //        } else if (myObj instanceof EnemyBullet) {
    //          hp = hp - 10;
    //          myObj.hp = 0;
    //        }
    //        immunity = 0;
    //      }//=====
    //    }
    //  }//====
    //  i++;
    //}//===

    int i = 0;
    while (i < myObjects.size()) {
      GameObject myObj = myObjects.get(i);
      if (myObj instanceof EnemyBullet && isCollidingWith(myObj)) {
        hp = hp-10;
        myObj.hp = 0;
      }
      if (myObj instanceof Enemy && isCollidingWith(myObj)) {
        
      }
        i++;
    }
    immunity++;
  }//act end
}
