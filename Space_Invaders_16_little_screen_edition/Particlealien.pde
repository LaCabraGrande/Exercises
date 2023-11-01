class Particlealien {
  float x, y;
  float speedX, speedY;
  float i;
  

  Particlealien(float x, float y) {
    this.x = x;
    this.y = y;
    speedX = random(-5, 5);
    speedY = random(-5, 5);
  }

  void update() {
    x += speedX;
    y += speedY;
  }

  void display(float size) {
    noStroke();
    fill(255);
    size = size+xspeed;
    i = 6-(size/10);
    if(i<1) {
      i=1;
    }
    
    ellipse(x, y, i, i);
  }
  
  boolean isOffScreen() {
    if(x>explodeX) {
      if(dist(x,y,explodeX,explodeY) > 50) {
        return true;
      }
    } else {
      if(dist(explodeX,explodeY,x,y) < -50) {
        return true;
      }  
    }    
    return false;
  }
  
}
