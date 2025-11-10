class SquareMan {
  // Member Variables
  int x, y, w, h;
  float yVel; // Vertical velocity for jumping
  float gravity; // Gravity to pull downward
  float jumpStrength; // Initial upward velocity for jump
  color c1;
  boolean isOnGround; // Tracks if SquareMan is on ground or platform
  Platform currentPlatform; // Tracks the platform SquareMan is standing on (null if not on a platform)

  // Constructor
  SquareMan(int x, int y, color c1) {
    this.x = x;
    this.y = y;
    this.c1 = c1;
    w = 30;
    h = 30;
    yVel = 0;
    gravity = 0.5;
    jumpStrength = -10;
    isOnGround = false;
    currentPlatform = null;
  }

  // Member Methods
  void display() {
    fill(c1);
    rectMode(CENTER);
    rect(x, y, w, h, 5);
  }

  void update() {
    // Apply gravity to velocity
    yVel += gravity;
    // Update vertical position
    y += yVel;

    // If on a platform, move with it
    if (currentPlatform != null && isOnGround) {
      x += currentPlatform.xVel; // Inherit platform's horizontal velocity
    }

    // Assume not on ground or platform initially
    isOnGround = false;
    currentPlatform = null;

    // Check for collision with ground
    int groundLevel = height - h/2;
    if (y > groundLevel) {
      y = groundLevel;
      yVel = 0;
      isOnGround = true;
    }

    // Check for collision with platforms
    for (Platform p : platforms) {
      if (isCollidingWith(p)) {
        // If falling and bottom is near platform top, land on it
        if (yVel > 0 && y + h/2 >= p.y - p.h/2 && y + h/2 <= p.y - p.h/2 + 10) { // Tolerance of 10 pixels
          y = p.y - p.h/2 - h/2; // Snap bottom to platform top
          yVel = 0; // Stop vertical movement
          isOnGround = true; // Allow jumping
          currentPlatform = p; // Track this platform
        }
      }
    }
  }

  // Check collision with a platform (horizontal overlap only)
  boolean isCollidingWith(Platform p) {
    return x + w/2 > p.x - p.w/2 && // Horizontal overlap
           x - w/2 < p.x + p.w/2;
  }

  void jump() {
    if (isOnGround) {
      yVel = jumpStrength;
      isOnGround = false;
      currentPlatform = null; // No longer on a platform when jumping
    }
  }
}
