class Weapon {
  
  int shotTimer;
  int threshold;
  int bulletSpeed; //how fast bullet zooms
  
  Weapon() {
    shotTimer = 0;
    threshold = 30;
    bulletSpeed = 5;
  }
  
  Weapon(int thr, int bs) {
   shotTimer = 0;
   threshold = thr;
   bulletSpeed = bs;
  }
  
  void update() {
   shotTimer++; 
  }
  
  void shoot() {
   if (shotTimer >= threshold) {
     PVector aimVector = new PVector(mouseX-myHero.loc.x+random(-10, 10), mouseY-myHero.loc.y+random(-10, 10));
     aimVector.setMag(bulletSpeed);
     myObjects.add(new Bullet(aimVector, #00FF4A, 10));
     shotTimer = 0;
   }
  }
}
