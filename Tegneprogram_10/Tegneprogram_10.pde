// Færdigkodet mandag d. 11/9-2023
int z = 1; // her initialiserer og deklarer jeg tælleren til nyTegning
int tempZ; // hjælpevariabel til når jeg bladrer i mine tegninger
boolean keyN = false;// her initialiserer og deklareret jeg en boolean karakter som bruges til at starte en ny Tegning op 
boolean keyA = false;
boolean keyD = false;
boolean keyF = false;
boolean keyG = false;
boolean keyB = false;
boolean keyR = false;
boolean keyY = false;
boolean keyS = false;
color farve = color(0,0,0);
String farvekode = "black";


Tegning[] nyTegning = new Tegning[z]; // Her initialiserer jeg Tegning-arrayet af objekter 


void setup() {
  size(800,800);
  background(255);
  nyTegning[0] = new Tegning(); // Her deklarerer jeg det første Terning objekt som kun skal indeholde et array af objekter af klassen Streg
  textSize(20);
  fill(0, 0, 0);
  text("Tegning : "+(z), 30, 50);  
}

void draw() {
  if(keyN) {
    background(255);
    keyG = false;
    keyY = false;
    keyB = false;
    keyR = false;
    farve = color(0,0,0);
    Tegning[] newTegning = new Tegning[nyTegning.length+1]; // her initieres et nyt object af typen Tegning
    textSize(20);
    fill(0, 0, 0);
    text("Tegning : "+(z), 30, 50); 
    for (int i = 0; i < nyTegning.length; i++) { // Her kopieres alle objekter af Tegning over i det nye array newTegning
      newTegning[i] = nyTegning[i];
    }
    newTegning[nyTegning.length] = new Tegning(); 
    nyTegning = newTegning; // Her kopieres det midlertidige array newTegning over i det gamle array nyTegning
    // nyTegning = (Tegning[]) append(nyTegning, new Tegning()); // Her kunne jeg også udvide arrayet Tegning[] med metoden append
  }

  if(mousePressed) {
    if (mouseButton == LEFT && mouseX>=5 && pmouseX>=5 && mouseX<=(width-5) && pmouseX<=(width-5) && mouseY>=100 && pmouseY>=100 && mouseY<=(height-5) && pmouseY<=(height-5)) {
      println("stregfarven er "+farvekode);
      println("keyB: "+keyB);
      println("keyR: "+keyR);
      println("keyG: "+keyG);
      println("keyY: "+keyY);
      stroke(farve);
      strokeWeight(1);
      line(pmouseX, pmouseY, mouseX, mouseY);
      nyTegning[tempZ].addnyStreg(new Streg(pmouseX,pmouseY,mouseX,mouseY,1,1,farve)); // her udvider jeg, ved hjælp af metoden addnyStreg, arrayet Streg[] med en nyStreg med musens koordinater
      println("nyTegning["+z+"] har "+nyTegning[z-1].nyStreg.length+" streger og stregfarven er "+farvekode); 
    } else if(mouseButton == RIGHT) {
      farve = color(255,255,255);
      stroke(farve);
      strokeWeight(5);
      line(pmouseX, pmouseY, mouseX, mouseY);
      nyTegning[tempZ].addnyStreg(new Streg(pmouseX,pmouseY,mouseX,mouseY,5,1,farve)); // her udvider jeg, ved hjælp af metoden addnyStreg, arrayet Streg[] med en nyStreg med musens koordinater
      println("nyTegning["+z+"] har "+nyTegning[z-1].nyStreg.length+" streger og stregfarven er "+farvekode); 
      
      
      
      
      
    }
  }
}

void keyPressed() {
  if(key == 'n' && !keyN || key == 'N' && !keyN) {
    z++;
    tempZ = z-1;
    background(255);
    stroke(0);
    keyN = true;
  }
  if(key == 'a' && !keyA && tempZ>0 || key == 'A' && !keyA && tempZ>0) {
    tempZ--;
    nyTegning[tempZ].tegnIgen();
    keyA = true;
  }
  if(key == 'd' && !keyD && tempZ<(z-1)|| key == 'D' && !keyD && tempZ<(z-1)) {
    tempZ++;
    nyTegning[tempZ].tegnIgen();
    keyD = true;
  }
  if(key == 'f' && !keyF && tempZ<(z-1)|| key == 'F' && !keyF && tempZ<(z-1)) {
     keyF = true;
  }
  if(key == 'g' && !keyG && tempZ<(z-1)|| key == 'G' && !keyG && tempZ<(z-1)) {
    farve = color(0,255,0);
    farvekode = "grøn";
    keyG = true;
  }
  if(key == 'b' && !keyB && tempZ<(z-1)|| key == 'D' && !keyB && tempZ<(z-1)) {
    farve = color(0,0,255);
    farvekode = "blå";
    keyB = true;
  }
  if(key == 'r' && !keyR && tempZ<(z-1)|| key == 'D' && !keyR && tempZ<(z-1)) {
    farve = color(255,0,0);
    farvekode = "rød";
    keyR = true;
  }
  if(key == 'y' && !keyY && tempZ<(z-1)|| key == 'Y' && !keyY && tempZ<(z-1)) {
    farve = color(255,255,0);
    farvekode = "gul";
    keyY = true;
  }
  if(key == 's' && !keyS && tempZ<(z-1)|| key == 'S' && !keyS && tempZ<(z-1)) {
    farve = color(0,0,0);
    farvekode = "sort";
    keyS = true;
  }
  
 
  
  
  
   println("Z er "+z+" og tempZ er "+tempZ);
   println("Du har lavet "+z+" tegninger");
}

void keyReleased() {
  if(key == 'n' || key == 'N') {
    keyN = false;
  }
  if(key == 'a' || key == 'A') {
    keyA = false;
  }
  if(key == 'd' || key == 'D') {
    keyD = false;
  }
  if(key == 'f' || key == 'F') {
    keyF = false;
  }
  if(key == 'g' || key == 'G') {
    farve = color(0,255,0);
    farvekode = "grøn";
    keyG = true;
    keyY = false;
    keyB = false;
    keyR = false;
    keyS = false;
  }
  if(key == 'y' || key == 'Y') {
    farve = color(255,255,0);
    farvekode = "gul";
    keyY = true;
    keyG = false;
    keyB = false;
    keyR = false;
    keyS = false;
  }
  if(key == 'b' || key == 'B') {
    farve = color(0,0,255);
    farvekode = "blå";
    keyB = true;
    keyY = false;
    keyG = false;
    keyR = false;
    keyS = false;
  }
  if(key == 'r' || key == 'R') {
    farve = color(255,0,0);
    farvekode = "rød";
    keyR = true;
    keyY = false;
    keyB = false;
    keyG = false;
    keyS = false;
  }
  if(key == 's' || key == 'S') {
    farve = color(0,0,0);
    farvekode = "sort";
    keyG = false;
    keyY = false;
    keyB = false;
    keyR = false;
  }
  
}     
