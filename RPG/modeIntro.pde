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
  text("THE MEDEIVAL ADVENTURES", width/2, height*0.25);
  textSize(50);
  text("OF", width/2, height*0.35);
  textSize(40);
  text("SIR CHOPPINGSKNOT", width/2, height*0.45);
  
  //Button Press
  if (introButton.clicked) {
   mode = game; 
  }
}
