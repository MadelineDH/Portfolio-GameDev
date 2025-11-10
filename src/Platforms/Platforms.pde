// Mr Kapptie | 10 Nov 2025 | Jump Tester with Looping Platforms and Top-Landing
SquareMan fred;
ArrayList<Platform> platforms;

void setup() {
  size(500, 500);
  background(127); 
  fred = new SquareMan(width/2, 100, color(0, 0, 255));
  
  // Initialize platforms
  platforms = new ArrayList<Platform>();
  // Add platforms (x, y, width, height, xVel)
  platforms.add(new Platform(200, 200, 100, 20, 2)); // Moves right
  
}
           
void draw() {
  background(127);
  
  // Update platforms first to ensure correct positions for collision
  for (Platform p : platforms) {
    p.update();
  }
  
  fred.update(); // Update SquareMan's position, velocity, and platform movement
  fred.display();
  
  // Draw platforms after SquareMan to visualize overlaps
  for (Platform p : platforms) {
    p.display();
  }
}

void keyPressed() {
  if (key == ' ') {
    fred.jump();
  }
}

void mousePressed() {
  fred.jump();
}
