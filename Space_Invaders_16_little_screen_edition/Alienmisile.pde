class Alienmisile {
  int xpos;
  int ypos;
  
  
  Alienmisile (int tempXpos,int tempYpos) {
    xpos = tempXpos;
    ypos = tempYpos;
    
  }
       
  void displayMisile() {
      fill(255,0,0);
      rect(xpos,ypos+20,5,30);
      rect(xpos-3,ypos+30,11,5);
     
  }
  
   void moveMisile() {
     ypos += 26;
     if (ypos>height) {
       launchAlienMisile = false;
       attackCounter = 0;
     }  
   }
  
   void launchAlienMisile() {
     alienmisile.add(new Alienmisile(player.getAlienX()+40, player.getAlienY()));
   }  
  
   int getX() {
     return xpos;
   }  
   int getY() {
     return ypos;
   }  
    
}  
