//Comment out if unwanted
void pause() {
  if (ekey) {
   ekey = false;
   mode = game;
  }
  
  background(brown);
  fill(black);
  text("XP: "+myHero.xp, width/2, height*0.1);
  
  addHpButton.show();
  addHpButton.act();
  fill(black);
  textSize(50);
  textAlign(CORNER, CENTER);
  text("HP: "+myHero.maxHp, width*0.4, height*0.3);
  if (addHpButton.clicked && myHero.xp >= 5) {
   myHero.maxHp = myHero.maxHp + 5;
   myHero.xp = myHero.xp - 5;
  }
  
  
  
  
}
