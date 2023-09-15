class Bold {
  float x,y,w,h,r;
  float xspeed;
  float yspeed;
  float red,blue,green;
  float tempRed,tempBlue,tempGreen;
  color farve;
    
  Bold(float tempX, float tempY, float tempR, float tempRed, float tempBlue, float tempGreen, float tempXsp, float tempYsp) {
    x = tempX;
    y = tempY;
    r = tempR;
    red = tempRed;
    blue = tempBlue;
    green = tempGreen;
    yspeed = tempYsp;
    xspeed = tempXsp;
  }
    
   
void interfeer(Bold[] b, int v) {
  float dx = b[v].x-x;
  float dy = b[v].y-y;
  float distance = sqrt(dx*dx + dy*dy);
  float minDist = (b[v].r+r)+4 ;
  if (distance < minDist) {    // Hvis distancen er mindre end summen af de to boldes radius+10 har de ramt hinanden
    float angle = atan2(dy, dx);
    float targetX = x + cos(angle) * minDist;
    float targetY = y + sin(angle) * minDist;
    float ax = (targetX - b[v].x) * spring;
    float ay = (targetY - b[v].y) * spring;
    xspeed -= ax;
    yspeed -= ay;
    b[v].xspeed += ax;
    b[v].yspeed += ay;
  }     
} 
  
void move() {
  y += yspeed;
  x += xspeed;
  if (x+r > width) {
    x = width - r;
    xspeed *= -1;
  } else if (x-r < 0) {
    x = r;
    xspeed *= -1;
  }
  if (y+r > height) {
    y = height - r;
    yspeed *= -1;
  } else if (y-r < 0) {
    y = r;
    yspeed *= -1;
  }  
}
    
void display() {
  farve = color(red,blue,green);
  noStroke();
  fill(farve);
  ellipse(x,y,(r*2),(r*2));
}  
}
