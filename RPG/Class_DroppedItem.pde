class DroppedItem extends GameObject {
  int type;
  int rng;
  int randWeapon;
  Weapon w;
  DroppedItem(float x, float y, int rx, int ry) {
    rng = int(random(0, 2));
    if (rng == 0) {
      type = GUN;
      c = yellow;
    } else if (rng == 1) {
      type = HEALTH;
      c = lred;
    }
    //typegen = int(random(0, 2));
    //type = HEALTH;
    randWeapon = int(random(0, 4));
    if (randWeapon == 0) {
      w = new AutoPistol();
    } else if (randWeapon == 1) {
      w = new Shotgun();
    } else if (randWeapon == 2) {
      w = new Flamethrower();
    } else if (randWeapon == 3) {
      w = new RingGun();
    }
    
    
      hp = 1;
      loc = new PVector(x, y);
      vel = new PVector(0, 0);
      size = 20;
      roomX = rx;
      roomY = ry;
    }

    void show() {
      if (type == GUN) {
        stroke(black);
        strokeWeight(2);
        fill(c);
        circle(loc.x, loc.y, size);
      } else if (type == HEALTH) {
        stroke(black);
        strokeWeight(2);
        fill(c);
        circle(loc.x, loc.y, size);
      }
    }

    void act() {
      //literally nothing
    }
  }
