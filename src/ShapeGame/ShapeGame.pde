// Madeline Hendrickson | Aug 29 2025 | ShapeGame
// Global Variables
import processing.sound.*;
int x,y,w,h,score,xspeed,yspeed,tx,ty, ms;
float tw, scale;
PImage apple,basket,startscreen,gameover;
SoundFile laser;
SoundFile yay;
boolean play;

// Setup is called once when the app starts
void setup() {
    size(500,600);
    background(28, 59, 32);
    frameRate(30);
    tw = 150;
    x = 10;
    y = 10;
    w = 20;
    h = 20;
    xspeed = 5;
    yspeed = 7;
    score = 0;
    tx = int(random(width));
    ty = int(random(height));
    apple = loadImage("apple.png");
    basket = loadImage("basket.png");
    laser = new SoundFile(this, "laser.wav");
    yay = new SoundFile(this, "yay.wav");
    play = false;
    startscreen = loadImage("startscreen.png");
    gameover = loadImage("gameover.png");
}
// Draw runs on a 30 fps until the app closes
void draw() {
  if (play == false) {
    startScreen();
  } else {
    background(28, 59, 32);
    stroke(255);
    fill(120,67,225);
    //ellipse(x,y,w,h);
    basket.resize(75,75);
    imageMode(CENTER);
    image(basket,x,y);
    apple.resize(50,50);
    target();
    scorePanel();
    
    
    
    //x = x + xspeed;
    //y = y + yspeed;
  } 
  if (key == 'w' || key == 'W') {
    y = y - 10;
  } else if (key == 's' || key == 'S') {
    y = y + 10;
  } else if (key == 'a' || key == 'A') {
    x = x - 10;
  } else if (key == 'd' || key == 'D') {
    x = x + 10;
  } 
}

void keyPressed() {
  //WASD movemet
  if (key == 'w' || key == 'W') {
    y = y - 10;
  } else if (key == 's' || key == 'S') {
    y = y + 10;
  } else if (key == 'a' || key == 'A') {
    x = x - 10;
  } else if (key == 'd' || key == 'D') {
    x = x + 10;
  } 
  
  if(keyCode == UP) {
    y-=5;
  } else if(keyCode == DOWN) {
    y+=5;
  } else if(keyCode == LEFT) {
    x-=5;
  } else if(keyCode == RIGHT) {
    x+=5;
  }
}

void scorePanel() {
  fill(168,54,50,222);
  rect(0,0,width,30);
  fill(255);
  textSize(25);
  text("Score: " + score,10,25);
  
}
void target() {
  float d = dist(x,y,tx,ty);
  if (tw<1) {
    gameOver();
  }
  println(d);
  if(d<50) {
    score = score + 1;
    tx = int(random(width));
    ty = int(random(height));
    tw = 150;
    if(laser.isPlaying()) {
      laser.play();
    } else {
      laser.stop();
      laser.play();
    }
    
    //I am so lost
  }
  tw=tw-1;
  image(apple,tx,ty,tw,tw);
  imageMode(CENTER);
}

void gameOver() {
  background(0);
  image(gameover,250,300);
  fill(255);
  text("Final score:" + score, width/2,height/2);
  yay.play();
  noLoop();
}

void startScreen () {
  background (255);
  image(startscreen,0,0);
  fill(0);
  text("click to start", width/2, height/2);
  if(mousePressed) {
    play = true;
  }
}
