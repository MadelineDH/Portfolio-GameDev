class Star {
  // Member Variables
  int x, y, w, speed;


  // Constructor
  Star() {
    x = int(random(width));
    y = -10;
    w = int(random(1, 4));
    speed = int(random(2, 10));
  }

  // Member Methods
  void display() {
    fill(0, 0, 255);
    stroke(255);
    ellipse(x, y, w, w);
  }

  void move() {
    y+=speed;
  }

  boolean reachedBottom() {
    if (y>height+10) {
      return true;
    } else {
      return false;
    }
  }
}
