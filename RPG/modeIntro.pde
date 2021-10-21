void intro() {
  click();
  
  //Basics
  background(0);
  
  //Button(s)
  introButton.show();
  introButton.act();
  
  
  //Crying in the corner text
  textSize(60);
  fill(255);
  text("CRYING IN THE CORNER", width/2, height*0.4);
  
  //Button Press
  if (introButton.clicked) {
   mode = game; 
  }
}
