class Bullet extends GameObject {
  int size;
  color CBullet;
  Bullet(PVector a, color c, int s) { //Constructor
    hp = 1;
    loc = new PVector(myHero.loc.x, myHero.loc.y);
    vel = a;
    //vel = new PVector(myHero.dir.x, myHero.dir.y);
    //vel.setMag(10);
    size = s;
    CBullet = c;
  }
  
  void show() {
    stroke(CBullet);
    strokeWeight(4);
    noFill();
    ellipse(loc.x, loc.y, size, size);
  }
  
  void act() {
   loc.add(vel);
   
   //MrP's code for hitting walls
   if (loc.x < width*0.1 || loc.x > width*0.9 || loc.y < height*0.1 || loc.y > height*0.9) hp = 0;
   if (loc.x > width*0.9) loc.x = width*0.9;
   if (loc.y < height*0.1) loc.y = height*0.1;
   if (loc.y > height*0.9) loc.y = height*0.9;
    
    
  }
  
}
