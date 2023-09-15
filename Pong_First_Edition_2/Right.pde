class Right {
float batXpos,batYpos,w,h;

Right (float tempXpos, float tempYpos, float tempWidth, float tempHeight) {
  batXpos = tempXpos;
  batYpos = tempYpos;
  w = tempWidth;
  h = tempHeight;
}



void display() {
 noStroke();
 fill(255);
 rect(batXpos,batYpos,w,h);
}

void interfeer(Bold b) {
  if(b.xpos-10 == 1490) {
    if(b.ypos>=batYpos && b.ypos<=batYpos+100) {
      b.xspeed = b.xspeed+1;
      b.xspeed = b.xspeed * -1;
    }  
  }
}
}
