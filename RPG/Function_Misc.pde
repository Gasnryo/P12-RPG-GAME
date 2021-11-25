void click() {
  mouseReleased = false;
  if (mousePressed) wasPressed = true;
  if (wasPressed && !mousePressed) {
    mouseReleased = true;
    wasPressed = false;
  }
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
