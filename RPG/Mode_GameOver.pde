void gameOver() {
  if (victory == true) {
    background(green);
    textSize(200);
    fill(blue);
    text("WINNER", width/2, height/2);
  } else if (victory == false) {
    background(dred);
    textSize(200);
    fill(green);
    text("YOU SUCK LOL", width/2, height/2);
  }
  
  restartButton.show();
  restartButton.act();
  if (restartButton.clicked == true) {
    restartButton.clicked = false;
   setup(); 
  }
}
