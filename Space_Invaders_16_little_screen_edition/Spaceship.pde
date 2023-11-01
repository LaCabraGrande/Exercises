class Spaceship {
  int xpos;
  int ypos;
  
  
  Spaceship (int tempXpos,int tempYpos) {
    xpos = tempXpos;
    ypos = tempYpos;
    
  }
  
  void displaySpaceship() {
       rectMode(CORNER);   
       noStroke();
       fill(255);
       rect(xpos,ypos,120,30);
       rect(xpos+10,ypos-10,100,10);
       rect(xpos+50,ypos-20,20,10);
       rect(xpos+58,ypos-25,5,5);
     
  }
  void moveLeft(float speed) {
    if(xpos-speed>0) {
      xpos -= speed;
    }  
  }
  
  void moveRight(float speed) {
    if(xpos+speed<width-120) {
      xpos += speed;
    }  
  }
  
  int getX() {
    return xpos;
  }
  
  int getY() {
    return ypos;
  } 
  
  void explode() {
     for (int i = 0; i < 100; i++) {
       particle.add(new Particle(getX()+60, getY()+10));
     }
  }
}  
