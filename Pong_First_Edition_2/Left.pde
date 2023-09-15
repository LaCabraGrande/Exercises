class Left {
float batleftXpos,batleftYpos,w,h;

Left (float tempXpos, float tempYpos, float tempWidth, float tempHeight) {
  batleftXpos = tempXpos;
  batleftYpos = tempYpos;
  w = tempWidth;
  h = tempHeight;
}



void display() {
 noStroke();
 fill(255);
 rect(batleftXpos,batleftYpos,w,h);
}

void interfeer(Bold b) {
  if(b.xpos+10 == 120) {
     if(b.ypos>=batleftYpos && b.ypos<=batleftYpos+100) {
       b.xspeed -= 1;
       b.xspeed = b.xspeed * -1;
     } 
  }
}

}
