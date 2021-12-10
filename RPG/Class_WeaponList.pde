//super(threshold, bulletspeed);


class SniperRifle extends Weapon {
 SniperRifle() {
  super(WEAPON_SNIPER_THRESHOLD, WEAPON_SNIPER_SPEED, WEAPON_SNIPER_DAMAGE); 
 }
}

class AutoPistol extends Weapon {
 AutoPistol() {
  super(WEAPON_AUTOPISTOL_THRESHOLD, WEAPON_AUTOPISTOL_SPEED, WEAPON_AUTOPISTOL_DAMAGE); 
 }
}

class Shotgun extends Weapon {
 Shotgun() {
   super(WEAPON_SHOTGUN_THRESHOLD, WEAPON_SHOTGUN_SPEED, WEAPON_SHOTGUN_DAMAGE);
 }
 
 void shoot() {
   if (shotTimer >= threshold) {
    for (int i = 0; i < WEAPON_SHOTGUN_BULLETCOUNT; i++) {
     PVector aimVector = new PVector(mouseX-myHero.loc.x, mouseY-myHero.loc.y);
     aimVector.rotate(random(-PI/8, PI/8));
     aimVector.setMag(bulletSpeed);
     myObjects.add(new Bullet(aimVector, #00FF4A, BULLET_SIZE, WEAPON_SHOTGUN_DAMAGE));
    }
    shotTimer = 0;
    }
   }
 }
 
class Flamethrower extends Weapon {
 Flamethrower() {
   super(WEAPON_FLAMETHROWER_THRESHOLD, WEAPON_FLAMETHROWER_SPEED, WEAPON_FLAMETHROWER_DAMAGE);
 }
 
 void shoot() {
   if (shotTimer >= threshold) {
     PVector aimVector = new PVector(mouseX-myHero.loc.x, mouseY-myHero.loc.y);
     aimVector.rotate(random(-PI/16, PI/16));
     aimVector.setMag(bulletSpeed);
     myObjects.add(new Bullet(aimVector, #00FF4A, BULLET_SIZE, damage));
     myObjects.add(new Bullet(aimVector, #00FF4A, BULLET_SIZE, damage));
     myObjects.add(new Bullet(aimVector, #00FF4A, BULLET_SIZE, damage));
     myObjects.add(new Bullet(aimVector, #00FF4A, BULLET_SIZE, damage));
     shotTimer = 0;
   }
  }
}

class RingGun extends Weapon {
 RingGun() {
   super(WEAPON_RINGGUN_THRESHOLD, WEAPON_RINGGUN_SPEED, WEAPON_RINGGUN_DAMAGE);
 }
 
 void shoot() {
   if (shotTimer >= threshold) {
    for (int i = 0; i < WEAPON_RINGGUN_BULLETCOUNT; i++) {
     PVector aimVector = new PVector(mouseX-myHero.loc.x, mouseY-myHero.loc.y);
     aimVector.rotate(random(-PI, PI));
     aimVector.setMag(bulletSpeed);
     myObjects.add(new Bullet(aimVector, #00FF4A, BULLET_SIZE, WEAPON_RINGGUN_DAMAGE));
    }
    shotTimer = 0;
    }
   }
 }
