class Message extends GameObject {
  String text;
  Message(PVector l, String x) {
    text = x;
    
    loc = l;
    
    roomX = myHero.roomX;
    roomY = myHero.roomY;
  }
  
  void show() {
    textSize(50);
    fill(lred);
    text(text, loc.x, loc.y);
  }
  
  void act() {
    loc.y = loc.y-2;
  }
}
