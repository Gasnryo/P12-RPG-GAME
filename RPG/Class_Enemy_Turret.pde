class Turret extends Enemy {
  int timer;
  int bulletSpeed;
 Turret(int x, int y, float posx, float posy) {
   super(FOLLOWER_HP, height/15, x, y, posx, posy);
   timer = 0;
   bulletSpeed = 4;
 }
 
 void show() {
   fill(green);
   stroke(black);
   strokeWeight(2);
   circle(loc.x, loc.y, size);
   fill(black);
   textSize(size*0.40);
   text(hp, loc.x, loc.y);
 }
 
 void act() {
   super.act();
   
   float vy = myHero.loc.y - loc.y;
   float vx = myHero.loc.x - loc.x;
    
    //Shoot Bullet
    timer++;
    if (timer == 90) {
      PVector aimVector = new PVector(vx, vy);
     aimVector.setMag(bulletSpeed);
     myObjects.add(new EnemyBullet(aimVector, #00FF4A, ENEMYBULLET_SIZE, damage, loc.x, loc.y));
     timer = 0; 
    }
    
    
    
    
 }
}
