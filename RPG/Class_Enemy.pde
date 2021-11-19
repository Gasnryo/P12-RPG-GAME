class Enemy extends GameObject {
  Enemy() {
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    hp = ENEMY_HP;
    size = height/15;
    roomX = 1;
    roomY = 1;
  }
  
  Enemy(int x, int y) {
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    hp = ENEMY_HP;
    size = height/15;
    roomX = x;
    roomY = y;
  }
  
  Enemy(int _hp, int s, int x, int y) {
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    hp = _hp;
    size = s;
    roomX = x;
    roomY = y;
  }
  
  void show() {
    
   //default enemy
   fill(HLYellow);
   stroke(black);
   strokeWeight(2);
   circle(loc.x, loc.y, size);
   fill(black);
   textSize(size*0.40);
   text(hp, loc.x, loc.y);
  }
  
  void act() {
    super.act();
    
    int i = 0;
    while (i < myObjects.size()) {
     GameObject obj = myObjects.get(i);
     if (obj instanceof Bullet) {
       float d = dist(obj.loc.x, obj.loc.y, loc.x, loc.y);
       if (d <= size/2 + obj.size/2) {
         //hp = hp-1;
         //change damage to be configured per bullet/weapon (DC15 vid)
         hp = hp - (int)obj.damage;
         obj.hp = 0;
       }
     }
      
      i++;
    }
  }
}
