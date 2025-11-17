// -------------------------------------------
// GLOBALS
// -------------------------------------------
char screen = 's';   // s = start, m = menu, t = settings, p = play, u = pause, g = game over, a = app stats
Button btnStart, btnMenu, btnSettings, btnBack;

// -------------------------------------------
void setup() {
  size(600, 400);

  // Example buttons for practice starter
  btnStart    = new Button("Play", 220, 150, 160, 50);
  btnMenu    = new Button("menu", 220, 220, 160, 50);
}

// -------------------------------------------
void draw() {
  background(230);
  switch(screen) {
  case 's':
    drawStart();
    break;
  case 'p':
    drawPlay();
    break;
  }
  //btnStart.display();
  //btnMenu.display();
}

// -------------------------------------------
// MOUSE CLICK HANDLER
// -------------------------------------------
void mousePressed() {
  switch(screen) {
    case 's':
    if(btnStart.clicked) {
      screen = 'p';
    }
  }
}

// -------------------------------------------
// SCREEN DRAW METHODS (Starter Example)
// -------------------------------------------
void drawStart() {
  background(100, 160, 200);
  textAlign(CENTER);
  textSize(32);
  text("START SCREEN", width/2, 50);
  btnStart.display();
}

void drawMenu() {
  background(120, 200, 140);
  textSize(32);
  text("MENU SCREEN", width/2, 50);
  btnMenu.display();
}

void drawSettings() {
  background(200, 150, 120);
  textSize(32);
  text("SETTINGS", width/2, 50);
  btnSettings.display();
}

// -------------------------------------------
// EMPTY SCREEN METHODS FOR STUDENT PROJECT
// -------------------------------------------

void drawPlay() {
  background(255);
  text("PLAY SCREEN (fill this in)", 200, 200);
}

void drawPause() {
  background(255);
  text("PAUSE SCREEN (fill this in)", 200, 200);
}

void drawGameOver() {
  background(255);
  text("GAME OVER SCREEN (fill this in)", 200, 200);
}

void drawStats() {
  background(255);
  text("STATS SCREEN (fill this in)", 200, 200);
}
