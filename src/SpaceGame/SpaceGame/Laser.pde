class Laser {
  // Member Variables
  int x, y, w, h, speed;
  PImage laser;

  // Constructor
  Laser(int x, int y) {
    this.x = x;
    this.y =y;
    w = 3;
    h = 10;
    speed = 10;
    laser = loadImage("laser.png");
  }

  // Member Methods
  void display() {
    imageMode(CENTER);
    image(laser,x,y);
    
    
    //rect(x, y, w, h);
    //rectMode(CENTER);
    //fill(255, 0, 0);
    //stroke(255);
  }

  void move() {
    y = y-speed;
  }

  boolean reachedTop() {
    if (y<0-10) {
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(Rock r) {
    float d = dist(x,y,r.x,r.y);
    if(d<50) {
      return true;
    } else {
      return false;
    }
  }
}
