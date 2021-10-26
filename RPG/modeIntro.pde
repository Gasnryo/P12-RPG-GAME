void intro() {
  click();
  
  //Basics
  background(0);
  
  //Button(s)
  introButton.show();
  introButton.act();
  
  
  //Crying in the corner text
  textFont(namefont);
  textSize(80);
  fill(red);
  text("REALLY CRAPPY", width/2, height*0.3);
  textSize(40);
  text("BINDING OF ISAAC", width/2, height*0.4);
  
  //Button Press
  if (introButton.clicked) {
   mode = game; 
  }
}
