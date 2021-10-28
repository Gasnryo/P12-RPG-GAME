class Hero extends GameObject {

  float speed, size;
  int roomX, roomY;

  Hero() {
    super();
    speed = 5;
    size = 40;
    roomX = 1;
    roomY = 1;
  }

  void show() { //display character
    fill(brown);
    stroke(gray);
    strokeWeight(3);
    circle(loc.x, loc.y, size);
  }

  void act() {
    super.act();

    //Hero Move
    if (w) vel.y = -speed;
    if (a) vel.x = -speed;
    if (s) vel.y = speed;
    if (d) vel.x = speed;

    if (vel.mag() > speed) vel.setMag(speed);

    //Stop when not moving
    if (!w && !s) vel.y = 0;
    if (w && s) vel.y = 0;
    if (!a && !d) vel.x = 0;
    if (a && d) vel.x = 0;

    ////hit walls extra
    //if (loc.x < width*0.1+size/2) loc.x = width*0.1+size/2;
    //if (loc.x > width*0.9-size/2) loc.x = width*0.9-size/2;
    //if (loc.y < height*0.1+size/2) loc.y = height*0.1+size/2;
    //if (loc.y > height*0.9-size/2) loc.y = height*0.9-size/2;

    //check exits
    //north
    if (northRoom != #FFFFFF && loc.y == height*0.1 && loc.x >= width/2-50 && loc.x <= width/2+50) {
      roomY--;
      loc = new PVector(width/2, height*0.9-10);
    }
    //east
    if (eastRoom != #FFFFFF && loc.x == width*0.9 && loc.y >= height/2-50 && loc.y <= height/2+50) {
      roomX++;
      loc = new PVector(width*0.1+10, height/2);
    }
    //south
    if (southRoom != #FFFFFF && loc.y == height*0.9 && loc.x >= width/2-50 && loc.x <= width/2+50) {
      roomY++;
      loc = new PVector(width/2, height*0.1+10);
    }
    //west
    if (westRoom != #FFFFFF && loc.x == width*0.1 && loc.y >= height/2-50 && loc.y <= height/2+50) {
      roomX--;
      loc = new PVector(width*0.9-10, height/2);
    }
  }
}
