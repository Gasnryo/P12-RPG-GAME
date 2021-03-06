class GameObject {
  PVector loc;
  PVector vel;
  int hp; //hitpoints
  int roomX, roomY;
  float size;
  float damage;
  color c;
  int xp;
  
 GameObject() {
   loc = new PVector (width/2, height/2);
   vel = new PVector (0, 0);
   hp = 1;
 }
 
 void show() {
 }
 
 void act() {
   loc.add(vel);
   
   //MrP's code for hitting walls
   if (loc.x < width*0.1) loc.x = width*0.1;
   if (loc.x > width*0.9) loc.x = width*0.9;
   if (loc.y < height*0.1) loc.y = height*0.1;
   if (loc.y > height*0.9) loc.y = height*0.9;
 }
 boolean inRoomWith(GameObject myObj) {
  if (roomX == myObj.roomX && roomY == myObj.roomY)
    return true;
  else
    return false;
}

boolean isCollidingWith (GameObject myObj) {
  float d = dist(myObj.loc.x, myObj.loc.y, loc.x, loc.y);
  if (inRoomWith(myObj) && d < size/2 + myObj.size/2)
    return true;
  else
    return false;
}
}
