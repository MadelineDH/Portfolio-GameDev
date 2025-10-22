//Madeline Hendrickson | 17 Sept 2025 | Space Game
import processing.sound.*;
Spaceship shipithink;
ArrayList<Rock> rocksmaybe = new ArrayList<Rock>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
ArrayList<Star> stars = new ArrayList<Star>();
ArrayList<PowerUp> pwrups = new ArrayList<PowerUp>();
Timer rockiscoming, pwrupTimer, levelTimer;
int score, rocksPassed, level;
PImage startscreen, gameover;
SoundFile laserfire, go;
boolean play;

void setup() {
  size (900, 600);
  background(1, 0, 33);
  shipithink = new Spaceship();
  rockiscoming = new Timer(1000);
  pwrupTimer = new Timer(15000);
  rockiscoming.start();
  pwrupTimer.start();
  levelTimer = new Timer(50000);
  levelTimer.start();
  score = 0;
  rocksPassed = 0;
  level = 1;
  play = false;
  startscreen = loadImage("StartscreenSPGM.png");
  gameover = loadImage("gameoverSPGM.png");
  laserfire = new SoundFile(this, "laserfire.wav");
  go = new SoundFile(this, "GMOVR.wav");
}


void draw() {
  if (!play) {
    startScreen();
  } else {
    background(1, 0, 33);



    if (pwrupTimer.isFinished()) {
      pwrups.add(new PowerUp());
      pwrupTimer.start();
    }
    //Display and move powerups
    for (int i = 0; i<pwrups.size(); i++) {
      PowerUp pu = pwrups.get(i);
      pu.move();
      pu.display();
      if (pu.reachedBottom()) {
        pwrups.remove(pu);
        i--;
      }
      //No turret because it quite litteraly breaks the power up function
      //I'm not sure why
      if (pu.intersect(shipithink)) {
        pwrups.remove(pu);
        if (pu.type == 't') {
          shipithink.laserCount+=100;
        } else if (pu.type == 'h') {
          shipithink.health++;
        } else if (pu.type == 'a') {
          shipithink.laserCount+=50;
        }
        i--;
      }
      println("PwrUp" + pwrups.size());
    }


    //dtributes stars
    stars.add(new Star());

    //display and remove stars
    for (int i = 0; i < stars.size(); i++) {
      Star star = stars.get(i);
      star.move();
      star.display();
      if (star.reachedBottom()) {
        stars.remove(star);
        i--;
      }
      println("Stars:" + stars.size());
    }

    //Distrobution of rocks
    if (rockiscoming.isFinished()) {
      rocksmaybe.add(new Rock());
      rockiscoming.start();
    }

    //display of all rocks
    for (int i = 0; i < rocksmaybe.size(); i++) {
      Rock rock = rocksmaybe.get(i);
      rock.display();
      rock.move();
      if (shipithink.intersect(rock)) {
        rocksmaybe.remove(rock);
        shipithink.health-=1;
        score-=200;
        i--;
      }
      if (rock.reachedBottom()) {
        rocksPassed++;
        rocksmaybe.remove(rock);
        i--;
        score-=100;
      }

      println("Rocks:" + rocksmaybe.size());
    }
    //Laser display and distrubution
    for (int i = 0; i < lasers.size(); i++) {
      Laser laser = lasers.get(i);
      for (int j = 0; j<rocksmaybe.size(); j++) {
        Rock r =rocksmaybe.get(j);
        if (laser.intersect(r)) {
          lasers.remove(laser);
          r.diam-=50;
          if (r.diam<8) {
            rocksmaybe.remove(r);
          }
          score+=100;
        }
      }
      laser.display();
      laser.move();

      if (shipithink.laserCount<0) {
        lasers.remove(laser);
        shipithink.laserCount++;
      }

      if (laser.reachedTop()) {
        lasers.remove(laser);
        i--;
      }
      println("lasers:" + lasers.size());
    }
    shipithink.display();
    shipithink.move(mouseX, mouseY);
    infoPanel();
    gameOver();
  }
}

void mousePressed() {
  lasers.add(new Laser(shipithink.x, shipithink.y));
  shipithink.laserCount--;
  laserfire.play();
  noCursor();
}


void infoPanel() {
  rectMode(CENTER);
  fill(0, 0, 255, 150);
  rect(width/2, height-25, width, 50);
  fill(255);
  textSize(30);
  text("Score:" + score, width-875, height - 20);
  text("Rocks Pased:" + rocksPassed, width - 210, height - 20);
  text("Health:" + shipithink.health, width - 710, height - 20);
  text("Ammo:" + shipithink.laserCount, width - 360, height - 20);
}
//start function
void startScreen() {
  image(startscreen, 0, 0);
  if (mousePressed) {
    play = true;
  }
}
//game over function
void gameOver() {
  if (shipithink.health < 1) {
    play = false;
    go.play();
    imageMode(CENTER);
    image (gameover, width/2, height/2);
    text (score, width- 500, height-100);
    noLoop();
  }
}
