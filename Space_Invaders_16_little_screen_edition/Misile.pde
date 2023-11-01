class Misile {
  int xpos;
  int ypos;
  
  
  Misile (int tempXpos,int tempYpos) {
    xpos = tempXpos;
    ypos = tempYpos;
    
  }
  
  void moveMisile() {
    ypos -= 46;
    if (ypos<20) {
      launch = false;
    }  
  }
  
  void displayMisile() {
    fill(255,255,0);
    rect(xpos,ypos,5,30);
  }
  
  int getX() {
     return xpos;
   }  
   
   int getY() {
     return ypos;
   } 
   
    
}  
