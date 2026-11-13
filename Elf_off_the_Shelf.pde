import processing.sound.*;

// game states
final int menu = 0;
final int playing = 1;
final int paused = 2;
final int game_over = 3;
final int victory = 4;
final int instructions = 5;

int gameState = menu;
String difficulty = "easy"; // the selected difficulty: "easy" or "hard"

// main menu buttons
Button easyButton;
Button hardButton;
Button startButton;
Button quitButton;
Button howToButton;
Button backButton;

PImage workshopBackground; // background image
PImage conveyorBelt;
// elf
Elf elf;
Obstacles present1;
Obstacles present2;

// sound files
SoundFile jingleMusic; // background music
SoundFile bellSound; // play every 100 points

// sets up the window and main menu buttoons
void setup(){
  size(612, 358);
  
  // main menu buttons
  easyButton = new Button("Easy", width / 2 - 115, 118, 110, 36);
  hardButton = new Button("Hard", width / 2 + 5, 118, 110, 36);
  startButton = new Button("Start", width / 2 - 90, 168, 180, 40);
  quitButton = new Button("Quit", width / 2 - 90, 218, 180, 40);
  howToButton = new Button("How to Play", width/2 - 90, 268, 180, 40);
  backButton = new Button("Back", width / 2 - 90, 295, 180, 40);
  
  //load the background image
  workshopBackground = loadImage("SantasWorkshopBackground.jpeg");
  conveyorBelt = loadImage("ConveyorBelt.png");

  // load the sounds and start the background music
  jingleMusic = new SoundFile(this, "jingle.mp3");
  bellSound = new SoundFile(this, "bell.mp3");
  jingleMusic.amp(0.4); // volume
  jingleMusic.loop();
  
  // temporary static elf and obstacles
  elf = new Elf(50, 200, 120, 120);
  present1 = new Obstacles("present", 300, 260, 75, 75);
  present2 = new Obstacles("present", 470, 260, 75, 75);
}


void draw(){
  // manage game states
  if(gameState == menu){
    drawMenu();
  }
  else if(gameState == playing){
   drawPlaying();
  }
  else if (gameState == instructions){
    drawInstructions();
  }
}


void drawMenu(){
  image(workshopBackground, 0, 0);
  
  // create a dark see-through layer
  noStroke();
  fill(0, 0, 0, 130);
  rect(0, 0, width, height);
  
  //display the title
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(40);
  text("Elf off the Shelf", width / 2, 45);
  
  // difficulty prompt above the Easy/Hard buttons
  fill(230);
  textSize(16);
  text("Choose Difficulty:", width / 2, 98);
  
  // highlight selected button
  easyButton.selected = difficulty.equals("easy");
  hardButton.selected = difficulty.equals("hard");
  
  // display the main menu buttons
  easyButton.display();
  hardButton.display();
  startButton.display();
  quitButton.display();
  howToButton.display();
}
void drawInstructions(){
  // background image
  image(workshopBackground, 0, 0, width, height);

  // dark see-through layer
  noStroke();
  fill(0, 0, 0, 170);
  rect(0, 0, width, height);

  // title
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(32);
  text("How to Play", width / 2, 45);

  // instructions
  textSize(25);
  text("Help the elf reach Santa's sleigh!", width / 2, 100);

  textSize(20);
  text("Jump over presents: UP arrow or LEFT click", width / 2, 145);
  text("Slide under mistletoe: DOWN arrow or RIGHT click", width / 2, 180);
  text("Reach Santa's sleigh to win!", width / 2, 215);
  text("P = Pause     M = Mute", width / 2, 250);

  // back to main menu
  backButton.display();
}

void drawPlaying() {
  // Draw the workshop background
  image(workshopBackground, 0, 0, width, height);
  noStroke();
  fill(80, 80, 80, 110);
  rect(0, 0, width, height);

  // Draw the conveyor belt
  image(conveyorBelt, 0, 310, width, 50);

  // Draw the elf
  elf.display();

  // Draw the presents
  present1.display();
  present2.display();
}

void mousePressed(){
   // track player selections
  if(gameState == menu){
    if(easyButton.isClicked(mouseX, mouseY)){
      difficulty = "easy";
    }
    else if(hardButton.isClicked(mouseX, mouseY)){
      difficulty = "hard";
    }
    else if(startButton.isClicked(mouseX, mouseY)){
      gameState = playing;
    }
    else if(quitButton.isClicked(mouseX, mouseY)){
      exit();
    }
    else if (howToButton.isClicked(mouseX, mouseY)){
      gameState = instructions;
    }
  }
  else if (gameState == instructions){
    if (backButton.isClicked(mouseX, mouseY)){
      gameState = menu;
    }
  }
}
