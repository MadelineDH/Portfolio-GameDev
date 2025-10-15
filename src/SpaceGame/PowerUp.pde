class PowerUp {
  // Member Variables
  int x, y, diam, speed;
  char type;
  PImage pu;
  color c1;

  // Constructor
  PowerUp() {
    x = int (random(width));
    y = -110;
    diam = 100;
    speed = 5;
    if (random(10)>1.11) {
      pu = loadImage("AA.png");
      type = 'a'; //AMMO
      c1 = color(0, 0, 255);
    } else if (random(10)>6.66) {
      pu = loadImage("health.png");
      type = 'h'; //HEALTH
      c1 = color(255, 0, 0);
    } else if (random(10)>9.99) {
      pu = loadImage("Ammo.png");
      type = 't'; //DOUBLE AMMO
      c1 = color(150);
    }
  }

  // Member Methods
  void display() {
    
    //fill(255);
    //textAlign(CENTER);
    //text(type, x, y);
    imageMode(CENTER);
    pu.resize(diam, diam);
    image(pu, x, y);
    
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
  boolean intersect(Spaceship s) {
    float d = dist(x,y,s.x,s.y);
    if(d<50) {
      return true;
    } else {
      return false;
    }
  }
}
