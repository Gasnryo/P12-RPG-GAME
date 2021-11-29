void keyPressed() {
  //Start Moving
  if (key == 'W') w = true;
  if (key == 'w') w = true;
  if (key == 'S') s = true;
  if (key == 's') s = true;
  if (key == 'A') a = true;
  if (key == 'a') a = true;
  if (key == 'D') d = true;
  if (key == 'd') d = true;
  if (key == ' ') space = true;
}

void keyReleased() {
  //Stop Moving
  if (key == 'W') w = false;
  if (key == 'w') w = false;
  if (key == 'S') s = false;
  if (key == 's') s = false;
  if (key == 'A') a = false;
  if (key == 'a') a = false;
  if (key == 'D') d = false;
  if (key == 'd') d = false;
  if (key == ' ') space = false;
}
