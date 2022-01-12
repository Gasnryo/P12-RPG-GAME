class Enemy extends GameObject {
  int dropchance;
  Enemy() {
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    hp = ENEMY_HP;
    size = height/15;
    roomX = 1;
    roomY = 1;
    dropchance = int(random(0, ENEMY_DROPCHANCE));
  }
  
  Enemy(int x, int y) {
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    hp = ENEMY_HP;
    size = height/15;
    roomX = x;
    roomY = y;
    dropchance = int(random(0, ENEMY_DROPCHANCE));
  }
  
  Enemy(int _hp, int s, int x, int y) {
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    hp = _hp;
    size = s;
    roomX = x;
    roomY = y;
    dropchance = int(random(0, ENEMY_DROPCHANCE));
  }
  
  Enemy(int _hp, int s, int x, int y, float posx, float posy) {
    loc = new PVector(posx, posy);
    vel = new PVector(0, 0);
    hp = _hp;
    size = s;
    roomX = x;
    roomY = y;
    dropchance = int(random(0, ENEMY_DROPCHANCE));
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
       if (isCollidingWith(obj) && hp >= 0) {
         hp = hp - (int)obj.damage;
         obj.hp = 0;
         if (hp <= 0) {
           myObjects.add(new Message(loc, "+"+xp));
           myHero.xp = myHero.xp + xp;
           enemyDeaths = enemyDeaths + 1;
           
           //drop items
           if (dropchance == 0) {
          myObjects.add(new DroppedItem(loc.x, loc.y, roomX, roomY));
           }
         }//end dropitem
         
       }
     }
      
      i++;
    }
  }
}
