void intro() {
  click();
  
  //Basics
  background(0);
  
  
  
  //Gif
  introGif.show();
  fill(0, 200);
  rect(width/2, height/2, width, height);
  
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
  text("THE UNNAMED KNIGHT", width/2, height*0.45);
  
  //Button Press
  if (introButton.clicked) {
   mode = game; 
  }
}
