class Spaceship {
  // Member Variables
  int x, y, w, health, laserCount, turretCount;
  PImage ship;

  // Constructor
  Spaceship() {
    x =width/2;
    y =height/2;
    w = 100;
    health = 5;
    laserCount = 151;
    turretCount = 2;
    ship = loadImage("spaceship.png");
  }

  // Member Methods
  void display() {
    image(ship, x, y);
    imageMode(CENTER);
    //triangle(x, y-65, x-45, y+20, x+45, y+20);
    //rectMode(CENTER);
    //rect(x, y-5, 40, 70);
    //rect(x-33, y+3, 10, 40);
    //rect(x+33, y+3, 10, 40);
    //triangle(x, y-65, x-20, y-40, x+20, y-40);
  }

  void move(int x, int y) {
    this.x = x;
    this.y = y;
  }

  boolean fire() {
    if(laserCount>0) {
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
