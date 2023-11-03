import java.util.ArrayList;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;
import processing.sound.*;

int numParticles = 100;
int num = 0;
int numRows = 11;
int numCol = 5;
int r = 80;
int ychange = 0;
int xspeed = 3;
int moveship = 8;
int walking = 0;
int time = 0;
int time2 = 0;
int y = 0;
int x = 0;
int xhit = 0;
int yhit = 0;
int timeBetweenAttack;
int timeBetweenAlienSpaceship = 300;
int appearence = 0;
int attackCounter = 0;
int numberOfAttackAliens = 11;
int whichAlienAttack = 0;
int xp;
int yp;
int numberOfLives = 3;
int counter;
int newcounter;
int point = 0;
int hiScore;
int alienhit = 0;
int level = 1;
float size;
float speed = 14;
float explodeX;
float explodeY;
float explodeAlienX;
float explodeAlienY;
boolean leftwall = false;
boolean rightwall = false;
boolean movealiens = false;
boolean keyA = false;
boolean keyD = false;
boolean keySpace = false;
boolean launch = false;
boolean hit = false;
boolean attack = false;
boolean launchAlienMisile = false;
boolean hitbyAlien = false;
boolean explode = false;
boolean hitAlienSpaceship = false;
boolean alienmisileHitBunker = false;
boolean explodeAlienSpaceship = false;

Player player;
Bunker bunker1;


ArrayList<Spaceship> spaceship;
ArrayList<Alienmisile> alienmisile;
ArrayList<Misile> misile;
ArrayList<Alienspaceship> alienspaceship;
ArrayList<Particle> particle;
ArrayList<Particlealien> particlealien;
ArrayList<Gamescore> gamescore;
PImage bg;
SoundFile file;
SoundFile laserMisile;
SoundFile fallingBomb;
SoundFile alienSpaceship;



void setup() {
  bg = loadImage("C:\\Users\\larsg\\Documents\\Processing\\Space_Invaders_16_little_screen_edition\\invaders4-1.png");
  background(bg);
  size(2000,1300);
  frameRate(30);
  player = new Player();
  particle = new ArrayList<Particle>();
  particlealien = new ArrayList<Particlealien>();
  spaceship = new ArrayList<>();
  spaceship.add(new Spaceship(1000,1200));
  alienmisile = new ArrayList<Alienmisile>();
  misile = new ArrayList<Misile>();
  alienspaceship = new ArrayList<Alienspaceship>();
  bunker1 = new Bunker(200,1050);
  timeBetweenAttack = (int)random(20,60);
  file = new SoundFile(this, "explosion.mp3");
  laserMisile = new SoundFile(this, "laser-gun.wav");
  fallingBomb = new SoundFile(this, "falling-bomb.wav");
  alienSpaceship = new SoundFile(this, "alienSpaceship.wav");
} 

void draw() {
  background(bg);
  text();
  attackCounter = attackCounter+1;
  appearence++; 
  walking++;
  bunker1.displayBunker();
  
        
  
  if(walking == 10) {
    movealiens = true;
  } else if(walking == 20) {
    movealiens = false;
    walking = 0;
  }  
  if(alienhit == 55) {
    level++;
    alienSpaceship.stop();
    laserMisile.stop();
    fallingBomb.stop();
   
    if(level<10) {
      timeBetweenAttack = (int)random(20-level,60-level);
    } else {
      timeBetweenAttack = (int)random(10,40);
    }  
    player.aliens.clear();
    misile.clear();
    alienmisile.clear();
    alienspaceship.clear();
    player.newSetOfAliens();
    appearence = 0;
    alienhit = 0;
    numberOfLives++;
    attackCounter = 0;
    point += 400;
  }  
  
  player.moveAliens();
  player.printAliens();
       
  if(spaceship.size()>0 && !explode) {
    spaceship.get(0).displaySpaceship();
  }
  
  if(explode) {
    counter += 1;
    for (int i = particle.size()-1; i >= 0; i--) {
      Particle p = particle.get(i);
      p.update();
      size = dist(p.x,p.y,explodeX+60,explodeY+10);
      if(size>60) {
        particle.remove(p);
      } else {
        p.display(size);
      }  
    }
    if (counter == 60) {
      explode = false;
      timeBetweenAttack = 0;
      attackCounter = 0;
      if(alienmisile.size()>0) {
        alienmisile.clear();
      }
    }  
  } else {
    particle.clear();
    counter = 0;
  }
  
  if(explodeAlienSpaceship) {
    newcounter += 1;
    for (int i = particlealien.size()-1; i >= 0; i--) {
      Particlealien p = particlealien.get(i);
      p.update();
      size = dist(p.x,p.y,explodeAlienX+60,explodeAlienY+10);
      if(size>60) {
        particlealien.remove(p);
      } else {
        p.display(size);
      }  
    }
    if (newcounter == 60) {
      explodeAlienSpaceship = false;
    }  
  } else {
    particlealien.clear();
    newcounter = 0;
  } 
  
 
  if(appearence >= timeBetweenAlienSpaceship && alienspaceship.size()<1) {
    alienSpaceship.play();
    if(int(random(1,3)) == 1) { 
      alienspaceship.add(new Alienspaceship(-150,100,(int)random(11,16)));
    } else {
      alienspaceship.add(new Alienspaceship(2150,100,(int)random(-11,-16)));
    }  
  }
  
  if(alienspaceship.size()>0) {
    for(Alienspaceship s: alienspaceship) {
      s.moveAlienSpaceship();
      s.displayAlienSpaceShip();
      if(misile.size()>0) {
        s.checkHit(misile);
      }  
    }  
  }  
    
  if(attackCounter >= timeBetweenAttack && player.getRowLength()>0) {
    whichAlienAttack = (int)random(0,player.aliens.get(0).size());
    alienmisile.add(new Alienmisile(player.getAlienX()+40,player.getAlienY()));
    timeBetweenAttack = (int)random(20,60);
    fallingBomb.play();
    attackCounter = 0;
  }
  
  if(alienmisile.size()>0 && !explode) {
     for(Alienmisile a : alienmisile) {
       a.moveMisile();
       bunker1.checkHitAlienMisile(a);
       if(!alienmisileHitBunker) {
         player.checkHitAlienMisile(spaceship, a.xpos, a.ypos+29);
       }
       a.displayMisile();
     }
     alienmisileHitBunker = false;
  }
     
  if(alienmisile.size()>0) {
     for (int b = 0; b<alienmisile.size();b++) {
       if(alienmisile.get(b).getY() > 1220) {
         Alienmisile a = alienmisile.get(b);
         alienmisile.remove(a);
       }  
     }  
  }
    
  if(hitbyAlien) {
    explodeX = spaceship.get(0).xpos;
    explodeY = spaceship.get(0).ypos;
    spaceship.get(0).explode();
    spaceship.clear();
    alienmisile.clear();
    hitbyAlien = false;
    spaceship.add(new Spaceship(1000,1200));
    file.play();
    explode = true;
  }
  
  if(hitAlienSpaceship) {
    explodeAlienX = alienspaceship.get(0).xpos;
    explodeAlienY = alienspaceship.get(0).ypos;
    alienspaceship.get(0).explode();
    alienspaceship.clear();
    hitAlienSpaceship = false;
    appearence = 0;
    alienSpaceship.stop();
    file.play();
    explodeAlienSpaceship = true;
  }
       
  if(launch) {
    for(Misile m: misile) {
       m.moveMisile();
       bunker1.checkHitMisile(misile);
       player.checkHit(misile);
       m.displayMisile();
    }
    if(misile.get(0).ypos<0) {
      misile.clear();
      launch = false; 
    }  
  }
  
  if(keyA) {
   for (Spaceship s : spaceship) {
      s.moveLeft(speed);
   }
  }
  
  if(keyD) {
    for (Spaceship s : spaceship) {
      s.moveRight(speed);
   }
  }
  
  if(misile.size()<1 && !launch && keySpace) {
     misile.add(new Misile(spaceship.get(0).xpos+58,1170));
     laserMisile.play();
     launch = true;
  }
  
  if(hit) {
    if(xspeed > 0) {
      xspeed = 3 + level + (alienhit/10);
    } else if(xspeed < 0) {
      xspeed = (3 + level + (alienhit/10)) * -1;
    }  
    
    time += 1;
    if(time == 5) {
      hit = false;
      time = 0;
    }
    fill(255);
    stroke(255); 
    strokeWeight(2);
    for(int i = 0; i<6; i++) {
      line((x-30)+i*10, y-i*7,x,y);
      line((x-30)+i*10, y+i*7,x,y);
      line((x+30)-i*10, y-i*7,x,y);
      line((x+30)-i*10, y+i*7,x,y); 
    }
  } 
  
  
  if(alienspaceship.size()>=1 && alienspaceship.get(0).xpos > 2200 || alienspaceship.size()>=1 && alienspaceship.get(0).xpos < -200)  {
    alienspaceship.clear();
    appearence = 0;
  }  
    
  if(numberOfLives < 0) {
    numberOfLives = 0;
    textGameOver();
    readFromscore();
    addToscore();
    writeToscore(gamescore);
    printTopScore();
    noLoop(); 
  }
}  
  
  void keyPressed() {
    if(keyCode == LEFT) {
      keyA = true;
    }
    if(keyCode == RIGHT) {
      keyD = true;
    }
    if(key == ' ') {
      keySpace = true;
    }  
  }
  
  void keyReleased() {
    if(keyCode == LEFT) {
      keyA = false;
    }
    if(keyCode == RIGHT) {
      keyD = false;
    }
    if(key == ' ') {
      keySpace = false;
    }  
  }
  
  void text() {
    textSize(60);
    fill(255,255,0);
    text("SCORE  ", 200, 70);
    fill(255);
    text(point, 400, 70);
    if(checkHiscore()<point) {
      hiScore = point;
    } else {
      hiScore = checkHiscore();
    }  
    fill(255,255,0);
    text("HI-SCORE  ",600,70);
    fill(255);
    text(hiScore, 875, 70);
    fill(255,255,0);
    text("LIVES  ", 1200, 70);
    fill(255);
    text(numberOfLives, 1365, 70);
    fill(255,255,0);
    text("LEVEL ",1600,70);
    fill(255);
    text(level,1775 ,70);
  }
  
  void textGameOver() {
    background(0);
    textSize(180);
    fill(255,0,0);
    text("Game Over", 600, 200);
  }
  
  void writeToscore(ArrayList<Gamescore> gamescore) {
        try {
            FileWriter writer = new FileWriter("C:\\Users\\larsg\\Documents\\Processing\\Space_Invaders_16_little_screen_edition\\scorelist.txt");
            //FileWriter writer = new FileWriter("../Data/scorelist.txt");
            for(Gamescore g : gamescore) {
                writer.write(g.getScore()+","+g.getDay()+","+g.getMonth()+","+g.getYear()+","+g.getHour()+","+g.getMinute()+"\n");
            }
            writer.close();
        } catch (IOException e) {
            System.out.println("Could not write to file");
        }
  }
    
  void readFromscore() {
      gamescore = new ArrayList<Gamescore>();
      File file = new File("C:\\Users\\larsg\\Documents\\Processing\\Space_Invaders_16_little_screen_edition\\scorelist.txt");
      //File file = new File("../Data/scorelist.txt");
      try {
            Scanner scanner = new Scanner(file);
            while (scanner.hasNextLine()) {
                String line = scanner.nextLine();
                String[] info = line.split(",");
                int score = Integer.parseInt(info[0]);
                int day = Integer.parseInt(info[1]);
                int month = Integer.parseInt(info[2]);
                int year = Integer.parseInt(info[3]);
                int hour = Integer.parseInt(info[4]);
                int minute = Integer.parseInt(info[5]);
                Gamescore g = new Gamescore(score,day,month,year,hour,minute);
                gamescore.add(g);
            }
            scanner.close();
        } catch (FileNotFoundException e) {
            System.out.println("File not found");
        }
  }
  
  void addToscore() {
    gamescore.add(new Gamescore(point,day(),month(),year(),hour(),minute()));
  }  
  
  void printTopScore() {
    textSize(120);
    fill(0,255,0);
    text("High Score", 750, 350);
    // Sortérer listen med den højeste score først
    gamescore.sort((a, b) -> b.score - a.score);
    int linie = 450;
    num = 0;
    String hour,minute,day,month,year;
    for(Gamescore t: gamescore) {
      num++;
      textSize(60);
      fill(255);
      if(num<10) {
        text(t.getScore(),640,linie);
        if(t.getDay()<10) {
          day = "0"+t.getDay();
        } else {
          day = ""+t.getDay();
        }
        if(t.getMonth()<10) {
          month = "0"+t.getMonth();
        } else {
          month = ""+t.getMonth();
        }
        year = ""+t.getYear();     
        text(day+"."+month+"."+year,840,linie);
        if(t.getHour()<10) {
          hour = "0"+t.getHour();
        } else {
          hour = ""+t.getHour();
        }  
        if(t.getMinute()<10) {
          minute = "0"+t.getMinute();
        } else {
          minute = ""+t.getMinute();
        }  
        text(hour+":"+minute, 1190, linie);
        //text(t.getHour()+":"+t.getMinute(), 1190, linie);
      }
      linie += 85;     
    }  
  }
   
  void createFile() {
    try {
      File file = new File("C:\\Users\\larsg\\Documents\\Processing\\Space_Invaders_16_little_screen_edition\\scorelist.txt");
      //File file = new File("../Data/scorelist.txt");
      if (file.createNewFile()) {
        System.out.println("File created: ");
      } else {
        System.out.println("File already exists.");
      }
    } catch (IOException e) {
      System.out.println("An error occurred.");
      e.printStackTrace();
    }
  }
  
  int checkHiscore() {
    readFromscore();
    gamescore.sort((a, b) -> b.score - a.score);
    if(gamescore.size()<0) {
      return 0;
    } else {
      return gamescore.get(0).getScore();
    }  
    
  }  

    
    
    
    
    
    
    
    
    
  
