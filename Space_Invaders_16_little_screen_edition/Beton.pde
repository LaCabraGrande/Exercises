class Beton {
  int xpos;
  int ypos;
  
  
  Beton (int xpos,int ypos) {
    this.xpos = xpos;
    this.ypos = ypos;
  }
  
  void displayBeton() {
    noStroke();
    fill(155);
    rect(xpos,ypos,5,5);
  }
  
  int getX() {
        return xpos;
  }

  int getY() {
        return ypos;
  }  

 
}
