class Spawner extends Enemy {
  int timer;
 Spawner(int x, int y, float posx, float posy) {
   super(SPAWNER_HP, height/15, x, y, posx, posy);
   timer = 0;
   xp = 10;
 }
 
 void show() {
   fill(blue);
   stroke(black);
   strokeWeight(2);
   circle(loc.x, loc.y, size);
   fill(black);
   textSize(size*0.40);
   textAlign(CENTER, CENTER);
   text(hp, loc.x, loc.y);
 }
 
 void act() {
   super.act();
   //Spawn Follower
    timer++;
    if (timer == 180) {
      
     myObjects.add(new Follower(myHero.roomX, myHero.roomY, loc.x, loc.y));
     timer = 0; 
    }
 }
}

//Follower(int x, int y, float posx, float posy) {
