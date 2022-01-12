class AnimatedGIF {

  PImage[] pics;
  int currentFrame;
  int numFrames;
  float x, y, w, h;
  int rate;

  AnimatedGIF(int nf, String pre, String post) {
    numFrames = nf;
    pics = new PImage[numFrames];
    int i = 0;
    while (i < numFrames) {
      pics[i] = loadImage(pre+i+post);
      i++;
    }
    currentFrame = 0;
    rate = 1;
  }
  
  AnimatedGIF(int nf, int r, String pre, String post) {
    numFrames = nf;
    pics = new PImage[numFrames];
    int i = 0;
    while (i < numFrames) {
      pics[i] = loadImage(pre+i+post);
      i++;
    }
    currentFrame = 0;
    rate = r;
  }
  
  AnimatedGIF(int nf, String pre, String post, float _x, float _y, float _w, float _h, int r) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    rate = r;
    numFrames = nf;
    pics = new PImage[numFrames];
    int i = 0;
    while (i < numFrames) {
      pics[i] = loadImage(pre+i+post);
      i++;
    }
    currentFrame = 0;
  }
  
  

  void show() {
    imageMode(CENTER);
    if (currentFrame == numFrames) currentFrame = 0;
    image(pics[currentFrame], x, y, w, h);
    //currentFrame++;
    if (frameCount % rate == 0) currentFrame++;
  }
  
  void show(float x, float y, float w, float h) {
    if (currentFrame == numFrames) currentFrame = 0;
    image(pics[currentFrame], x, y, w, h);
    //currentFrame++;
    if (frameCount % rate == 0) currentFrame++;
  }
  
  
} //end of class
