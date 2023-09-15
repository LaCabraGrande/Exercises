class Tegning {
   Streg[] nyStreg;
  
Tegning () {
   nyStreg = new Streg[0]; // Initialize an empty array for nyStreg
}

void addnyStreg(Streg ny) {
    Streg[] newStreg = new Streg[nyStreg.length+1]; // her oprettes en ny tom nyStreg
    for (int i = 0; i < nyStreg.length; i++) {
      newStreg[i] = nyStreg[i];
    }
    newStreg[nyStreg.length] = ny;
    nyStreg = newStreg;
    //println("nyTegning["+z+"] har "+nyTegning[z-1].nyStreg.length+" streger");
    println("nyTegning["+z+"] har "+nyStreg.length+" streger");
}

void addnyTegning() { // Metoden bruges ikke lige nu da jeg ikke kunne få det til at fungerer
    Tegning[] newTegning = new Tegning[nyTegning.length+1]; // her oprettes en ny tom nyStreg
    for (int i = 0; i < nyTegning.length; i++) {
      newTegning[i] = nyTegning[i];
    }
    newTegning[nyTegning.length] = new Tegning();
    nyTegning = newTegning;
    println("nyTegning["+z+"] har "+nyTegning[z-1].nyStreg.length+" streger");
}

void tegnIgen() {
  color farve;
  background(255);
  textSize(20);
  fill(0, 0, 0);
  text("Tegning : "+(tempZ+1), 30, 50);
  for(int w = 0; w<nyTegning[tempZ].nyStreg.length; w++) {  
    farve = nyTegning[tempZ].nyStreg[w].c;
    stroke(farve);
    strokeWeight(nyTegning[tempZ].nyStreg[w].s);
    line(nyTegning[tempZ].nyStreg[w].xposp, nyTegning[tempZ].nyStreg[w].yposp, nyTegning[tempZ].nyStreg[w].xpos, nyTegning[tempZ].nyStreg[w].ypos); 
  }  
}  
  
}
