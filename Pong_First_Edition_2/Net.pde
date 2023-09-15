class Net {
  float netYpos;
  float netXpos;
  float w,h;
  
Net (float tempXpos, float tempYpos, float tempW, float tempH) {
  netYpos = tempYpos;
  netXpos = tempXpos;
  w = tempW;
  h = tempH;
}

void display() {
 
    noStroke();
    fill(255);
    rect(netXpos,0,5,height);
    // netYpos = netYpos+(i*30)+5;
} 



}
  
  
