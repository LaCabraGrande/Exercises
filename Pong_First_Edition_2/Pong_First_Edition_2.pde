Right rightBat;
Left leftBat;
Bold spilleBold;
Net nytNet; 
boolean keyW = false;
boolean keyS = false;
boolean keyO = false;
boolean keyL = false;
boolean point = false;
float xspeed = 5;
float yspeed = 1;
int letterSize=80;
int leftPlayer,rightPlayer = 0;
boolean finalscore = false;
boolean score;


void setup() {
  background(0);
  size(1600,800);
  smooth();
  frameRate(60);
  spilleBold = new Bold(320,410,10,xspeed,yspeed);
  leftBat = new Left(100,400,10,100);
  rightBat = new Right(1500,400,10,100);
  nytNet = new Net(800,0,5,30);
  nytNet.display();
}

void draw() {
 background(0);
 nytNet.display();
 rightBat.display();
 leftBat.display();
 textSize(60);
 fill(0, 408, 612);
 text(leftPlayer, 600, 120);
 text(rightPlayer, 1000, 120);
 if(leftPlayer==5 || rightPlayer==5) {
   if(leftPlayer==5) {
     for(int m=0; m<20; m++) {
       textSize(letterSize+m);
       textAlign(CENTER, CENTER);
       fill(0, 408, 612);
       text("Winner", 250, 300);
       text("Loser", 1100, 300);
       textSize(letterSize+m-1);
       fill(0,0,0);
       text("Winner", 250, 300);
       text("Loser", 1100, 300);
       
     }  
 } else {
     for(int m=0; m<20; m++) {
       textSize(letterSize+m);
       textAlign(CENTER, CENTER);
       fill(0, 408, 612);
       text("Winner", 1100, 300);
       text("Loser", 250, 300);
       textSize(letterSize+m-1);
       fill(0,0,0);
       text("Winner", 250, 300);
       text("Loser", 1100, 300);
       
     }   
 }
 }
 if(leftPlayer<5 && rightPlayer<5) {
 
 spilleBold.move();
 rightBat.interfeer(spilleBold);
 leftBat.interfeer(spilleBold);
 println(""+spilleBold.xspeed);
 spilleBold.display(); 
 
   
 if(point) {
   if(spilleBold.xpos<=0) {
     spilleBold.xpos = 800;
     spilleBold.ypos = random(200,600);
     spilleBold.r = 10;
     spilleBold.xspeed = random(5,7);
     spilleBold.yspeed = random(0,2);
     point = false;
     score = true;
   }
   if(spilleBold.xpos>=width) {
     spilleBold.xpos = 800;
     spilleBold.ypos = random(200,600);
     spilleBold.r = 10;
     spilleBold.xspeed = random(-5,-7);
     spilleBold.yspeed = random(-0,-2);
     point = false;
     score = true;
   }
 } 


 


if(keyW) {
  leftBat.batleftYpos = leftBat.batleftYpos-6;
}
if(keyS) {
  leftBat.batleftYpos = leftBat.batleftYpos+6;
}
if(keyO) {
  rightBat.batYpos = rightBat.batYpos-6;
}
if(keyL) {
  rightBat.batYpos = rightBat.batYpos+6;
}

leftBat.batleftYpos = constrain(leftBat.batleftYpos,0,730);
rightBat.batYpos = constrain(rightBat.batYpos,0,730);
} 
}

void keyPressed() {
  // Move both objects when a key is pressed
  if(key == 'w' || key == 'W') {
    keyW = true; 
  } else if(key == 's' || key =='S') {
    keyS = true;
  }
  if(key == 'o' || key == 'O') {
    keyO = true; 
  } else if(key == 'l' || key =='L') {
    keyL = true;
  }
}  
  
void keyReleased() {
  // Move both objects when a key is pressed
  if(key == 'w' || key == 'W') {
    keyW = false; 
  } else if(key == 's' || key =='S') {
     keyS = false;
  }
  if(key == 'o' || key == 'O') {
    keyO = false; 
  } else if(key == 'l' || key =='L') {
     keyL = false;
  }
}     
  
