
class Obstacles {
  float x, y, w, h;
  String type;
  PImage obstacleImage;

  // creates an obstacle and loads its corresponding image
  Obstacles(String type, float x, float y, float w, float h) {
    this.type = type;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;

    if (type.equals("mistletoe")) {
      obstacleImage = loadImage("Mistletoe.png");
    }
    else if (type.equals("present")) {
      int colorChoice = int(random(4));

      if (colorChoice == 0) {
        obstacleImage = loadImage("RedGreenPresent.png");
      }
      else if (colorChoice == 1) {
        obstacleImage = loadImage("GreenRedPresent.png");
      }
      else if (colorChoice == 2) {
        obstacleImage = loadImage("BluePresent.png");
      }
      else {
        obstacleImage = loadImage("YellowPresent.png");
      }
    }
  }

  // displays the obstacle
  void display() {
    image(obstacleImage, x, y, w, h);
  }

  // the obstacle along the conveyor belt
  void update(float speed) {
    
  }

  // checks for collisions with the elf
  boolean checkCollision(Elf elf) {
    
    return false;
  }

  // checks if the obstacle leaves the screen
  boolean isOffScreen() {
    
    return false;
  }
}
