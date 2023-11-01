// Færdigkodet mandag d. 11/9-2023

int z = 1; // her deklarerer og initialiserer jeg tælleren til nyTegning
int tempZ; // hjælpevariabel til når jeg bladrer i mine tegninger
int strokeW = 1; // Fed eller ikke fed
boolean keyN = false; // her initialiserer og deklareret jeg en boolean karakter som bruges til at starte en ny Tegning op 
boolean keyA = false; // De følgende 3 boolean variabler bruges når jeg skal bladre i tegningerne
boolean keyD = false;
boolean keyF = false;
String farveT = "Sort";
color farve = color(0,0,0); // grundfarven sort


Tegning[] nyTegning = new Tegning[z]; // Her deklarerer jeg nyTegning-arrayet som er et array af objekter af Tegning klassen 


void setup() {
  
  size(800,800);
  background(255);
  nyTegning[0] = new Tegning(); // Her initialiserer jeg det første Terning objekt som kun skal indeholde et array af objekter af klassen Streg
  tegningtext(); // Her skriver jeg på skærmen på hvilken tegning vi er 
}

void draw() {
  tegningfed(); // Hvis jeg har valgt at tegne med fed bliver der skrevet fed på skærmen
  farveTekst(farveT);
  
  if(mousePressed) {
    if (mouseButton == LEFT && mouseX>=5 && pmouseX>=5 && mouseX<=(width-5) && pmouseX<=(width-5) && mouseY>=100 && pmouseY>=100 && mouseY<=(height-5) && pmouseY<=(height-5)) {
      stroke(farve);
      strokeWeight(strokeW);
      line(pmouseX, pmouseY, mouseX, mouseY);
      nyTegning[tempZ].addnyStreg(new Streg(pmouseX,pmouseY,mouseX,mouseY,1,strokeW,farve)); // her udvider jeg, ved hjælp af metoden addnyStreg, arrayet Streg[] med en nyStreg med musens koordinater
      println("nyTegning["+z+"] har "+nyTegning[z-1].nyStreg.length+" streger"); 
    } else if(mouseButton == RIGHT) {
      farve = color(255,255,255);
      stroke(farve);
      strokeWeight(10);
      line(pmouseX, pmouseY, mouseX, mouseY);
      nyTegning[tempZ].addnyStreg(new Streg(pmouseX,pmouseY,mouseX,mouseY,10,1,farve)); // her udvider jeg, ved hjælp af metoden addnyStreg, arrayet Streg[] med en nyStreg med musens koordinater
    }
  }
}

void keyPressed() {
  if(key == 'n' && !keyN || key == 'N' && !keyN) {
    z++;
    tempZ = z-1;
    background(255);
    stroke(0);
    farveT = "Sort";
    nyTegning[nyTegning.length-1].addnyTegning();
    keyN = true;
  }
  if(key == 'a' && !keyA && tempZ>0 || key == 'A' && !keyA && tempZ>0) {
    tempZ--;
    nyTegning[tempZ].tegnTegning();
    keyA = true;
  }
  if(key == 'd' && !keyD && tempZ<(z-1)|| key == 'D' && !keyD && tempZ<(z-1)) {
    tempZ++;
    nyTegning[tempZ].tegnTegning();
    keyD = true;
  }
  if(key == 'f' || key == 'F' && tempZ<(z-1)) {
     if(keyF) {
       keyF = false;
       strokeW = 1;
     } else {
       strokeW = 3;
       keyF = true;
     }  
  }
  if(key == 'g' || key == 'G' && tempZ<(z-1)) {
    farve = color(0,255,0);
    farveUdvisk();
    farveT = "Grøn";
  }
  if(key == 'b' || key == 'B' && tempZ<(z-1)) {
    farve = color(0,0,255);
    farveUdvisk();
    farveT = "Blå";
  }
  if(key == 'r' || key == 'R' && tempZ<(z-1)) {
    farve = color(255,0,0);
    farveUdvisk();
    farveT = "Rød";
  }
  if(key == 'y' || key == 'Y' && tempZ<(z-1)) {
    farve = color(255,255,0);
    farveUdvisk();
    farveT = "Gul";
  }
  if(key == 's' || key == 'S' && tempZ<(z-1)) {
    farve = color(0,0,0);
    farveUdvisk();
    farveT = "Sort";
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
}

void tegningfed() {
 if(keyF) {
    textSize(20);
    fill(0, 0, 0);
    text("Fed", 630, 50);
  } else {
    textSize(20);
    fill(255, 255, 255);
    text("Fed", 630, 50);
  }  
}

void tegningtext() {
  textSize(20);
  fill(0, 0, 0);
  text("Tegning : "+(tempZ+1), 30, 50);
}

void farveTekst(String farveT) {
    textSize(20);
    fill(255, 255, 255);
    text("      ", 580, 50);
    textSize(20);
    fill(0, 0, 0);
    text(farveT, 580, 50);
}

void farveUdvisk() {
    noStroke();
    fill(255,255,255);
    rectMode(CORNER);
    rect(580,33,50,20);
}     
