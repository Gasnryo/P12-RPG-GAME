class DarknessCell {
  float opacity;
  float x, y, size;
  float d;
 DarknessCell(float _x, float _y, float s) {
   size = s;
   x = _x;
   y = _y;
   opacity = 100;
 }
 
 void show() {
   fill(black, opacity);
   noStroke();
   
   d = dist(myHero.loc.x, myHero.loc.y, x, y);
   opacity = map(d,0,height*0.35,0,255);
   
   square(x, y, size);
   
   
 }
 
 void act() {
   
 }
}
