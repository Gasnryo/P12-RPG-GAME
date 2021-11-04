void game() {
  drawRoom();
  drawGameObjects();
  drawLightLayer();
  drawMiniMap();
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
   circle(width/2, height*0.1, doorSize);
 }
 if (eastRoom != #FFFFFF) {
   circle(width*0.9, height/2, doorSize);
 }
 if (southRoom != #FFFFFF) {
   circle(width/2, height*0.9, doorSize);
 }
 if (westRoom != #FFFFFF) {
   circle(width*0.1, height/2, doorSize);
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

void drawMiniMap() {
  int size = 20;
  int x = 0, y = 0;
  while (y < map.height) {
    color c = map.get(x, y);
    if (c == #FFFFFF) {
     c = #674309; 
    } else {
     c = #5A544A; 
    }
    fill(c);
    noStroke();
    square(x*size+50, y*size+50, size);
    x=x+1;
    if (x >= map.width) {
      y = y+1;
      x = 0;
    }
    //y = y+200;
  }
  fill(0, 255, 0);
  square(myHero.roomX*size+50, myHero.roomY*size+50, size);
}
