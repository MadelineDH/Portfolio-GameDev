class Rock {
  // Member Variables
  int x, y, diam, speed;
  PImage r1;

  // Constructor
  Rock() {
    x = int (random(width));
    y = -110;
    diam = int (random(50, 100));
    speed = int (random(1, 8));
    if (random(10)>8.0) {
      r1 = loadImage("rock1.png");
    } else if (random(10)>4.0) {
      r1 = loadImage("rock2.png");
    } else {
      r1 = loadImage("rock3.png");
    }
  }

  // Member Methods
  void display() {
    imageMode(CENTER);
    r1.resize(diam, diam);
    image(r1, x, y);
  }

  void move() {
    y  = y+speed;
  }

  boolean reachedBottom() {
    if (y>height+100) {
      return true;
    } else {
      return false;
    }
  }
}
