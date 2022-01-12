//Comment out if unwanted
void pause() {
  click();
  if (ekey) {
    ekey = false;
    mode = game;
  }


  background(brown);

  //draw corners
 image(Wall1, width/2, height/2, width, height);
 stroke(black);
 strokeWeight(4);
 line(0, 0, width, height);
 line(width, 0, 0, height);
  
  //draw floor
 rectMode(CENTER);
 stroke(black);
 strokeWeight(10);
 //fill(red);
 noFill();
 rect(width/2, height/2, width*0.8, height*0.8);
 image(Floor1, width/2, height/2, width*0.8, height*0.8);

  textAlign(CENTER);
  fill(white);
  textSize(75);
  text("XP: "+myHero.xp, width/2, height*0.1);

  //hp button
  addHpButton.show();
  addHpButton.act();
  fill(white);
  textSize(50);
  textAlign(CORNER, CENTER);
  text("$"+hpPrice+": "+"HP: "+myHero.maxHp, width*0.4, height*0.3);
  if (addHpButton.clicked && myHero.xp >= hpPrice) {
    myHero.xp = myHero.xp - hpPrice;
    hpPrice = hpPrice + 5;
    if (myHero.hp == myHero.maxHp) {
      myHero.maxHp = myHero.maxHp + 5;
      myHero.hp = myHero.maxHp;
    } else {
      myHero.maxHp = myHero.maxHp + 5;
    }
  }

  //speed button
  addSpeedButton.show();
  addSpeedButton.act();
  fill(white);
  textSize(50);
  textAlign(CORNER, CENTER);
  text("$"+speedPrice+": "+"Speed: "+myHero.speed, width*0.4, height*0.5);
  if (addSpeedButton.clicked && myHero.xp >= speedPrice) {
    myHero.xp = myHero.xp - speedPrice;
    myHero.speed = myHero.speed + 0.5;
    speedPrice = speedPrice + 5;
  }
} //=============================
