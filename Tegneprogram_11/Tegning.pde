import java.util.Arrays;


class Tegning {
   Streg[] nyStreg;
  
Tegning () {
   nyStreg = new Streg[0]; // Initialize an empty array for nyStreg
}

void addnyTegning() {
    strokeW = 1;
    background(255);
    tegningtext();
    tegningfed();
    farve = color(0,0,0);
    Tegning[] newTegning = new Tegning[nyTegning.length+1]; // her initieres et nyt object af typen Tegning
    for (int i = 0; i < nyTegning.length; i++) { // Her kopieres alle objekter af Tegning over i det nye array newTegning
      newTegning[i] = nyTegning[i];
    }
    newTegning[nyTegning.length] = new Tegning(); 
    nyTegning = newTegning; // Her kopieres det midlertidige array newTegning over i det gamle array nyTegning
    // nyTegning = (Tegning[]) append(nyTegning, new Tegning()); // Her kunne jeg også udvide arrayet Tegning[] med metoden append
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

void tegnTegning() {
  background(255);
  tegningtext();
  for(int w = 0; w<nyTegning[tempZ].nyStreg.length; w++) {  
    stroke(nyTegning[tempZ].nyStreg[w].c);
    strokeWeight(nyTegning[tempZ].nyStreg[w].f);
    line(nyTegning[tempZ].nyStreg[w].xposp, nyTegning[tempZ].nyStreg[w].yposp, nyTegning[tempZ].nyStreg[w].xpos, nyTegning[tempZ].nyStreg[w].ypos); 
  }
}  
  
}
