class Follower extends Enemy {
  
  Follower(int x, int y) {
   super(FOLLOWER_HP, height/15, x, y ); 
  }
  void show() {
    
   //default enemy
   fill(red);
   stroke(black);
   strokeWeight(2);
   circle(loc.x, loc.y, size);
   fill(black);
   textSize(size*0.40);
   text(hp, loc.x, loc.y);
    
  }
  
  void act() {
    super.act();
    
    vel = new PVector(myHero.loc.x - loc.x, myHero.loc.y - loc.y);
    vel.setMag(2.5);
    
  } 
}
