class Alienspaceship {
  int xpos;
  int ypos;
  int speedX;
  
  Alienspaceship (int tempXpos,int tempYpos, int speedX) {
    xpos = tempXpos;
    ypos = tempYpos;
    this.speedX = speedX;
  }
  
  void moveAlienSpaceship() {
    xpos += speedX;
  }
  
  void displayAlienSpaceShip() {
    noStroke();
    fill(255,0,0);
    rect(xpos+55,ypos,50,10);
    rect(xpos+40,ypos+10,80,10);
    rect(xpos+30,ypos+20,100,10);
    rect(xpos+20,ypos+30,120,10);
    fill(0);
    rect(xpos+35,ypos+30,10,10);
    rect(xpos+60,ypos+30,10,10);
    rect(xpos+85,ypos+30,10,10);
    rect(xpos+110,ypos+30,10,10);
    fill(255,0,0);
    rect(xpos+10,ypos+40,140,10);
    rect(xpos+25,ypos+50,30,10);
    rect(xpos+70,ypos+50,15,10);
    rect(xpos+100,ypos+50,30,10);
    rect(xpos+35,ypos+60,10,10);
    rect(xpos+110,ypos+60,10,10);
  }  
  
    
  void checkHit(ArrayList<Misile> m) {
     if(m.get(0).xpos>=xpos && m.get(0).xpos<=xpos+140 && m.get(0).ypos<=ypos+70 && m.get(0).ypos>ypos+30) {
       m.get(0).ypos = -1;
       hitAlienSpaceship = true;
       if(speedX >= 0) {
         point = point+100+(speedX*10);
       } else {
         point = point+100+((speedX*-1)*10);
       } 
       hitAlienSpaceship = true;
       x = alienspaceship.get(0).xpos+70;
       y = alienspaceship.get(0).ypos+35;
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
       particlealien.add(new Particlealien(getX()+60, getY()+10));
     }
  }
 
}
