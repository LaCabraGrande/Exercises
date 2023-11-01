import java.util.ArrayList;

class Player {
  ArrayList<ArrayList<Alien>> aliens;
  int aliensMaxy;
  int s;
  
  Player () {
    aliens = new ArrayList<>(numCol);
    for(int i = 0; i<numCol;i++) {
      ArrayList<Alien> row = new ArrayList<>(numRows);
      for(int j = 0; j<numRows;j++) {
        Alien obj = new Alien(300+(j*130),250+(i*130));
        row.add(obj);
      }
      aliens.add(row);
    }
  }  
  
  void newSetOfAliens() {
    aliens = new ArrayList<>(numCol);
    for(int i = 0; i<numCol;i++) {
      ArrayList<Alien> row = new ArrayList<>(numRows);
      for(int j = 0; j<numRows;j++) {
        Alien obj = new Alien(300+(j*130),250+(i*130));
        row.add(obj);
      }
      aliens.add(row);
    }
  }  
    
   void printAliens() {
       int line = 0;  
       for (ArrayList<Alien> row : aliens) {
         line++;   
         for (Alien obj : row) {
           aliensMaxy = obj.ypos;  
           if(line == 1) {
                fill(255,0,0);
                noStroke();
                rect(obj.xpos+25,obj.ypos-14,30,7);
                rect(obj.xpos+15,obj.ypos-7,50,7);
                rect(obj.xpos+10,obj.ypos,60,7);
                rect(obj.xpos,obj.ypos+7,80,14);
                fill(0);
                rect(obj.xpos+15,obj.ypos+7,7,7);
                rect(obj.xpos+60,obj.ypos+7,7,7);
                fill(255,0,0);
                rect(obj.xpos+25,obj.ypos+21,7,7);
                rect(obj.xpos+50,obj.ypos+21,7,7);
                if(movealiens) {
                  rect(obj.xpos+18,obj.ypos+28,7,7);
                  rect(obj.xpos+32,obj.ypos+28,18,7);
                  rect(obj.xpos+57,obj.ypos+28,7,7);
                  rect(obj.xpos+11,obj.ypos+35,7,7);
                  rect(obj.xpos+25,obj.ypos+35,7,7);
                  rect(obj.xpos+50,obj.ypos+35,7,7);
                  rect(obj.xpos+64,obj.ypos+35,7,7);
                } else {
                  rect(obj.xpos+7,obj.ypos+21,7,7);
                  rect(obj.xpos+22,obj.ypos+21,37,7);
                  rect(obj.xpos+66,obj.ypos+21,7,7);
                  rect(obj.xpos,obj.ypos+28,7,7);
                  rect(obj.xpos+73,obj.ypos+28,7,7);
                  rect(obj.xpos+7,obj.ypos+35,7,7);
                  rect(obj.xpos+66,obj.ypos+35,7,7);                  
                }
              } else if(line == 2 || line ==3) {
                  if(movealiens) {
                    fill(0,0,255);
                    rect(obj.xpos+14,obj.ypos,7,7);
                    rect(obj.xpos+56,obj.ypos,7,7);
                    rect(obj.xpos,obj.ypos+7,7,7);
                    rect(obj.xpos+21,obj.ypos+7,7,7);
                    rect(obj.xpos+49,obj.ypos+7,7,7);
                    rect(obj.xpos+70,obj.ypos+7,7,7);
                    rect(obj.xpos,obj.ypos+14,7,7);
                    rect(obj.xpos+14,obj.ypos+14,49,7);
                    rect(obj.xpos+70,obj.ypos+14,7,7);
                    rect(obj.xpos,obj.ypos+21,77,14);
                    fill(0);
                    rect(obj.xpos+21,obj.ypos+21,7,7);
                    rect(obj.xpos+49,obj.ypos+21,7,7);
                    fill(0,0,255);
                    rect(obj.xpos+7,obj.ypos+35,63,7);
                    rect(obj.xpos+14,obj.ypos+42,7,7);
                    rect(obj.xpos+56,obj.ypos+42,7,7);
                    rect(obj.xpos+7,obj.ypos+49,7,7);
                    rect(obj.xpos+63,obj.ypos+49,7,7);
                  } else {
                    fill(0,0,255);
                    rect(obj.xpos+14,obj.ypos,7,7);
                    rect(obj.xpos+56,obj.ypos,7,7);
                    rect(obj.xpos+21,obj.ypos+7,7,7);
                    rect(obj.xpos+49,obj.ypos+7,7,7);
                    rect(obj.xpos+14,obj.ypos+14,49,7);
                    rect(obj.xpos+7,obj.ypos+21,63,7);
                    fill(0);
                    rect(obj.xpos+21,obj.ypos+21,7,7);
                    rect(obj.xpos+49,obj.ypos+21,7,7);
                    fill(0,0,255);
                    rect(obj.xpos,obj.ypos+28,77,14);
                    rect(obj.xpos,obj.ypos+42,7,7);
                    rect(obj.xpos+56,obj.ypos+42,7,7);
                    rect(obj.xpos+14,obj.ypos+42,7,7);
                    rect(obj.xpos+70,obj.ypos+42,7,7);
                    rect(obj.xpos+21,obj.ypos+49,14,7);
                    rect(obj.xpos+45,obj.ypos+49,14,7);
                  }  
            } else if(line == 4 || line == 5) { 
              fill(0,255,0);
              noStroke();
              rect(obj.getX(),obj.getY(),80,21);
              rect(obj.getX()+5,obj.getY()-7,70,7);
              rect(obj.getX()+25,obj.getY()-14,30,7);
              fill(0);
              rect(obj.getX()+20,obj.getY()+7,13,7);
              rect(obj.getX()+45,obj.getY()+7,13,7);
              fill(0,255,0);
              rect(obj.getX()+20,obj.getY()+21,15,7);
              rect(obj.getX()+45,obj.getY()+21,15,7);
              rect(obj.getX()+15,obj.getY()+28,15,7);
              rect(obj.getX()+35,obj.getY()+28,10,7);
              rect(obj.getX()+50,obj.getY()+28,15,7);
              if(movealiens) {
                rect(obj.getX(),obj.getY()+35,15,7);
                rect(obj.getX()+65,obj.getY()+35,15,7);
              } else {
                rect(obj.getX()+20,obj.getY()+35,15,7);
                rect(obj.getX()+45,obj.getY()+35,15,7);
              } 
            }  
       }
   }
   }
    
   int getRowLength() {
        if (aliens.isEmpty()) {
            return 0;
        }
        return aliens.get(0).size();
   }
   
   int getAlienSize() {
     s = 0;
     for(int i = 0; i<aliens.size();i++) {
       s = s + aliens.get(i).size();
     }
     println("antal aliens : "+s);
     return s;
     
   }  
     
   void moveAliens() {
      for (ArrayList<Alien> row : aliens) {
        for (Alien obj : row) {
              if(obj.getX()<=0) {
                leftwall = true;
              } else if(obj.getX()>=(width-80)) {
                rightwall = true;
              }  
        }
      }
      
      if (leftwall) {
        xspeed = xspeed * -1;
        if(aliensMaxy<950) {
           ychange = 30;
        }
      }
      if (rightwall) {
        xspeed *= -1;
        if(aliensMaxy<950) {
          ychange = 30;
        }  
      } 
            
      for (ArrayList<Alien> row : aliens) {
        for (Alien obj : row) {
            obj.xpos += xspeed;
            obj.ypos += ychange;
        }
      }
      ychange = 0;
      leftwall = false;
      rightwall = false;
   }

   void checkHit(ArrayList<Misile> m) {
      int linie = 0;
      for (ArrayList<Alien> row : aliens) {
        linie++;
        for (int i = row.size() - 1; i >= 0; i--) {
          Alien alien = row.get(i);
          if(m.get(0).xpos>=alien.xpos && m.get(0).xpos<=alien.xpos+80 && m.get(0).ypos<=alien.ypos+40 && m.get(0).ypos>alien.ypos-40) {
            m.get(0).ypos = -1;
            point = point+10;
            if(linie == 1) {
              point += 30;
            } else if(linie == 2 || linie == 3) {
              point += 10;
            }  
            row.remove(i);
            alienhit += 1;
            hit = true;
            x = alien.getX()+40;
            y = alien.getY()+15;
            numberOfAttackAliens = aliens.get(0).size();
          }
        }
      }
   }
    
   void checkHitAlienMisile(ArrayList<Spaceship> s, int xpos, int ypos) {
         if(xpos >= s.get(0).getX() && xpos <= (s.get(0).getX()+122) && ypos >= s.get(0).getY() && ypos <= 1260) {
            ypos = 1305;
            hitbyAlien = true;
            numberOfLives -= 1;
         }
   }
   
   int getAlienX() {
     int tempXpos = 0;
     int num = 0;
     for (int i = 0; i < aliens.get(0).size(); i++) {
        Alien attobj = aliens.get(0).get(i);
        if (attobj.getX() != 0) {
          if (num == whichAlienAttack) {
             tempXpos = attobj.getX(); 
          }
          num += 1;
        }
     }
     numberOfAttackAliens = aliens.get(0).size();
     return tempXpos;
    }
    
    int getAlienY() {
      int tempYpos = 0;
      int num = 0;
      for (int i = 0; i < aliens.get(0).size(); i++) {
        Alien attobj = aliens.get(0).get(i);
        if (attobj.getY() != 0) {
          if (num == whichAlienAttack) {
             tempYpos = attobj.getY(); 
          }
          num += 1;
        }
      }  
      return tempYpos;
    }
    
    
}    
        
    
    
    
