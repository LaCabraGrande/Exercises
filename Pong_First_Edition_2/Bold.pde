class Bold {
  float xpos,ypos,r,xspeed,yspeed;
  
Bold(float tempXpos, float tempYpos, float tempR, float tempXspeed, float tempYspeed) {
  xpos = tempXpos;
  ypos = tempYpos;
  r = tempR;
  xspeed = tempXspeed;
  yspeed = tempYspeed;
}

void move() {
  xpos = xpos + xspeed;
  ypos = ypos + yspeed;
  if (xpos<120 && xpos>=90) {
    if(ypos+10>leftBat.batleftYpos && ypos-10<leftBat.batleftYpos+100) {
       xpos = 120;
       xspeed -= 0.5;
       xspeed = xspeed * -1;
    }
  } else if(xpos<=0) {
      rightPlayer++;
      point = true;
  }  
        
  
  if (xpos>1490 && xpos<=1520) {
    if(ypos+10>rightBat.batYpos && ypos-10<rightBat.batYpos+100) {
      xpos = 1490;
      xspeed += 0.5;
      xspeed = xspeed * -1;
    }
  } else if(xpos>=width) {
      leftPlayer++;
      point = true;
  }   
  
  
  
  if (ypos > height-(2*r)) {
    ypos = ypos -1;
    yspeed *= -1;
  } else if (ypos<=(2*r)) {
    yspeed *= -1;
    ypos = ypos+1;
  }  
} 


void display() {
  fill(255);
  ellipse(xpos,ypos,r*2,r*2);
}

  
}
