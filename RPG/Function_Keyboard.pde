void keyPressed() {
  //Start Moving
  if (key == 'W') w = true;
  if (key == 'S') s = true;
  if (key == 'A') a = true;
  if (key == 'D') d = true;
  if (key == ' ') space = true;
  if (key == 'E') ekey = true;
}

void keyReleased() {
  //Stop Moving
  if (key == 'W') w = false;
  if (key == 'S') s = false;
  if (key == 'A') a = false;
  if (key == 'D') d = false;
  if (key == ' ') space = false;
  if (key == 'E') ekey = false;
}
