class Spawner extends Enemy {
  int timer;
 Spawner(int x, int y, float posx, float posy) {
   super(SPAWNER_HP, height/15, x, y, posx, posy);
   timer = 0;
 }
 
 void show() {
   fill(blue);
   stroke(black);
   strokeWeight(2);
   circle(loc.x, loc.y, size);
   fill(black);
   textSize(size*0.40);
   text(hp, loc.x, loc.y);
 }
 
 void act() {
   //Shoot Bullet
    timer++;
    if (timer == 60) {
      
     myObjects.add(new Follower(myHero.roomX, myHero.roomY, loc.x, loc.y));
     timer = 0; 
    }
 }
}

//Follower(int x, int y, float posx, float posy) {
