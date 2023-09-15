// Færdigkodet mandag d. 4/9-2023
// I dette program  får jeg trænet lidt i brugen af Arrays af objekter, i coalitions og i tilføjelse af objekter til et Array af objekter
float spring = 0.10;
Bold[] nyBold = new Bold[0];
int antal = 0;

void setup() {
  size(2600,1600);
  background(255);
  noStroke();
  frameRate(60);
    
}  

void draw() {
  background(0);
  if (mousePressed) {
    Bold ny = new Bold(random(50,width-50), random(50,height-50),random(20,40),random(0,255),random(0,255),random(0,255),random(-1,1),random(-1,1));
    nyBold = (Bold[]) append(nyBold,ny);
  }  
    
  for (int p = 0; p<nyBold.length; p++) {
   
    for (int o = 0; o<nyBold.length;o++) {
      nyBold[p].interfeer(nyBold, o);
    }
       nyBold[p].display();
       nyBold[p].move();
       
  }
}  
