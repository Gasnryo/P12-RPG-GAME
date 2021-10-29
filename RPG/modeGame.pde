void game() {
  drawRoom();
  drawGameObjects();
  drawLightLayer();
  //drawMiniMap();
}

void drawRoom() {
 background(dred);
 
 //draw corners
 image(Wall1, width/2, height/2, width, height);
 stroke(black);
 strokeWeight(4);
 line(0, 0, width, height);
 line(width, 0, 0, height);
 
 //Draw Exits
 //#1 - Find out which directions have exits
 northRoom = map.get(myHero.roomX, myHero.roomY-1);
 eastRoom = map.get(myHero.roomX+1, myHero.roomY);
 southRoom = map.get(myHero.roomX, myHero.roomY+1);
 westRoom = map.get(myHero.roomX-1, myHero.roomY);
 
 //#2 - Draw the doors where there are exits
 noStroke();
 fill(black);
 if (northRoom != #FFFFFF) {
   ellipse(width/2, height*0.1, 100, 100);
 }
 if (eastRoom != #FFFFFF) {
   ellipse(width*0.9, height/2, 100, 100);
 }
 if (southRoom != #FFFFFF) {
   ellipse(width/2, height*0.9, 100, 100);
 }
 if (westRoom != #FFFFFF) {
   ellipse(width*0.1, height/2, 100, 100);
 }
 
 //draw floor
 rectMode(CENTER);
 stroke(black);
 strokeWeight(10);
 //fill(red);
 noFill();
 rect(width/2, height/2, width*0.8, height*0.8);
 image(Floor1, width/2, height/2, width*0.8, height*0.8);
}

//Spawn objects
void drawGameObjects() {
  int i = 0;
 while (i < myObjects.size()) {
  GameObject obj = myObjects.get(i);
  obj.show();
  obj.act();
  if (obj.hp <= 0) {
   myObjects.remove(i);
  } else {
    i++;
  }
 }
}

void drawLightLayer() {
  int l = 0;
 while (l < darkness.size()) {
  DarknessCell dark = darkness.get(l);
  dark.show();
  dark.act();
  l++;
 }
}
