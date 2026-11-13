class Button {
  // handles positioning and button size
  float x;
  float y;
  float w;
  float h;
  
  String label; //what the button wil display
  boolean selected = false;
  
  // initialize a button
  Button(String label, float x, float y, float w, float h){
    this.label = label;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  // mouseX and mouseY will be passed in as parameters
  // returns true if the click is within the bounds of the button
  boolean isClicked(float mx, float my){
    if((mx > x && mx < x + w) && (my > y && my < y + h)){
      return true;
    }
    return false;
  }
  
  //draws the button, turns green when selected, light red when highlighted
  //and dark red otherwise
  void display(){
    if(selected){
      fill(#267627);
    }
    else if(isClicked(mouseX, mouseY)){
      fill(#E83636);
    }
    else{
      fill(#C11F1F);
    }
    
     // drawing the container
    stroke(255);
    if (selected) {
      strokeWeight(3);
    } else {
      strokeWeight(1);
    }
    rect(x, y, w, h, 10);
    
    // drawing the text
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(20);
    text(label, x + w /2, y + h / 2);
  }
  
}
