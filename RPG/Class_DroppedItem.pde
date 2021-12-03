class DroppedItem extends GameObject {
  int type;
  int rng;
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
    w = new Shotgun();
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
