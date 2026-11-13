
class Elf {
  float x;
  float y;
  float w;
  float h;

  PImage reubenImage;

  boolean jumping = false;
  boolean sliding = false;

  // Constructor: sets the elf's position, size, and image
  Elf(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;

    reubenImage = loadImage("Reuben.png");
  }

  // displays the elf at its current position
  void display() {
    image(reubenImage, x, y, w, h);
  }

  // will make the elf jump over presents
  void jump() {
    // implement jumping
  }

  // Will make the elf slide under mistletoe
  void slide() {
    // implement sliding
  }

  // update the elf's position and animation
  void update() {
    // implement movement
  }

  // restore the elf to its starting position
  void reset() {
    jumping = false;
    sliding = false;
  }
}
