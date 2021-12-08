class Follower extends Enemy {
  
  Follower(int x, int y, float posx, float posy) {
   super(FOLLOWER_HP, height/15, x, y, posx, posy);
   xp = 1;
  }
  void show() {
    
   //default enemy
   fill(red);
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
    
    vel = new PVector(myHero.loc.x - loc.x, myHero.loc.y - loc.y);
    vel.setMag(FOLLOWER_SPEED);
    
    
  } 
}
