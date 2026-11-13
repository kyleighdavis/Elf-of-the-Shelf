import processing.sound.*;

// game states
final int menu = 0;
final int playing = 1;
final int paused = 2;
final int game_over = 3;
final int victory = 4;

int gameState = menu;
String difficulty = "easy"; // the selected difficulty: "easy" or "hard"

// main menu buttons
Button easyButton;
Button hardButton;
Button startButton;
Button quitButton;

PImage workshopBackground; // background image

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
  
  //load the background image
  workshopBackground = loadImage("SantasWorkshopBackground.jpeg");
  
  // load the sounds and start the background music
  jingleMusic = new SoundFile(this, "jingle.mp3");
  bellSound = new SoundFile(this, "bell.mp3");
  jingleMusic.amp(0.4); // volume
  jingleMusic.loop();
}


void draw(){
  // manage game states
  if(gameState == menu){
    drawMenu();
  }
  else if(gameState == playing){
    //temporary placeholder
    background(30);
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(24);
    text("Playing on " + difficulty + " (coming soon)", width / 2, height / 2);
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
  
  // display the instructions
  noStroke();
  fill(0,0,0,150);
  rect(0,272,width,64);
  fill(240);
  textSize(14);
  text("Jump over presents: UP arrow or LEFT click | Slide under mistletoe: DOWN arrow or RIGHT click", width / 2, 350);
  text("Reach Santa's sleigh to win!   P = pause  M = mute", width / 2, 375);
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
  }
}
