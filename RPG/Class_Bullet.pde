class Bullet extends GameObject {
  boolean StuckInWall;
  color CBullet;
  int timer;
  Bullet(PVector a, color c, int s, float dmg) { //Constructor
    hp = 1;
    loc = new PVector(myHero.loc.x, myHero.loc.y);
    vel = a;
    //vel.add(myHero.vel);
    //vel = new PVector(myHero.dir.x, myHero.dir.y);
    //vel.setMag(10);
    size = s;
    CBullet = c;
    StuckInWall = false;
    damage = dmg;
    timer = 120;

    roomX = myHero.roomX;
    roomY = myHero.roomY;
  }

  void show() {
    //stroke(CBullet);
    //strokeWeight(4);
    //noFill();
    //ellipse(loc.x, loc.y, size, size);
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(vel.heading()+PI/2);
    image(Bolt, 0, 0, 10, 46);
    popMatrix();
  }

  void act() {
    if (StuckInWall == false) {
      loc.add(vel);
    } else {
      timer = timer-1;
      if (timer == 0) {
        hp = 0;
      }
    }

    //MrP's code for hitting walls
    if (loc.x < width*0.1 || loc.x > width*0.9 || loc.y < height*0.1 || loc.y > height*0.9) StuckInWall = true; //hp = 0;
    if (loc.x > width*0.9) loc.x = width*0.9;
    if (loc.y < height*0.1) loc.y = height*0.1;
    if (loc.y > height*0.9) loc.y = height*0.9;
  }
}


class EnemyBullet extends GameObject {
  boolean StuckInWall;
  color CBullet;
  int timer;
  EnemyBullet(PVector a, color c, int s, float dmg) { //Constructor
    hp = 1;
    loc = new PVector(loc.x, loc.y);
    vel = a;
    size = s;
    CBullet = c;
    StuckInWall = false;
    damage = dmg;
    timer = 120;

    roomX = myHero.roomX;
    roomY = myHero.roomY;
  }

  void show() {
    //pushMatrix();
    //translate(loc.x, loc.y);
    //rotate(vel.heading()+PI/2);
    //image(Bolt, 0, 0, 10, 46);
    //popMatrix();
    stroke(CBullet);
    strokeWeight(4);
    noFill();
    ellipse(loc.x, loc.y, size, size);
  }

  void act() {
    if (StuckInWall == false) {
      loc.add(vel);
    } else {
      timer = timer-1;
      if (timer == 0) {
        hp = 0;
      }
    }

    //MrP's code for hitting walls
    if (loc.x < width*0.1 || loc.x > width*0.9 || loc.y < height*0.1 || loc.y > height*0.9) StuckInWall = true; //hp = 0;
    if (loc.x > width*0.9) loc.x = width*0.9;
    if (loc.y < height*0.1) loc.y = height*0.1;
    if (loc.y > height*0.9) loc.y = height*0.9;
  
  }
}
