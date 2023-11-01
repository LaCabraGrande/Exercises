class Bunker {
  ArrayList<ArrayList<Beton>> beton;
  int hitXpos;
  
  Bunker (int xpos, int ypos) {
    beton = new ArrayList<>();
    for(int i = 0; i<20;i++) {
      ArrayList<Beton> row = new ArrayList<>();
      for(int j = 0; j<340 ;j++) {
        Beton obj = new Beton(xpos+(j*5),ypos+(i*5));
        if(i>=0 && i<=7) {
          if(i == 0) {
            if(j>=6 && j<=34 || j>=96 && j<=124 || j>=186 && j<=214 || j>=276 && j<=304) { 
              row.add(obj);
            }  
          }
          if(i == 1) {
            if(j>=4 && j<=36 || j>=94 && j<=126 || j>=184 && j<=216 || j>=274 && j<=306) { 
              row.add(obj);
            }  
          }
          if(i == 2) {
            if(j>=2 && j<=38 || j>=92 && j<=128 || j>=182 && j<=218 || j>=272 && j<=308) { 
              row.add(obj);
            }  
          }
          if(i>2 && i<=7) {
            if(j>=0 && j<=40 || j>=90 && j<=130 || j>=180 && j<=220 || j>=270 && j<=310) { 
              row.add(obj);
            }
          }  
        } else if(i>=7 && i<=20) {
          if(j>=0 && j<=10 || j>=30 && j<=40 || j>=90 && j<=100 || j>=120 && j<=130 || j>=180 && j<=190 || j>=210 && j<=220 || j>= 270 && j<=280 || j>= 300 && j<=310) {
            row.add(obj);
          }  
        }  
      }
      beton.add(row);
    }
  }
  
  void displayBunker() {
    for (ArrayList<Beton> row : beton) {
       for (Beton obj : row) {
         obj.displayBeton();
       }
    }
  }
  void checkHitMisile(ArrayList<Misile> m) {
    
    for(int i = beton.size()-1; i>=0;i--) {
      for( int j = 0; j < beton.get(i).size()-1;j++) {
        if(m.get(0).xpos >= beton.get(i).get(j).xpos && m.get(0).xpos <= (beton.get(i).get(j).xpos+5) && m.get(0).ypos > -1) {
          if((m.get(0).ypos+22) <= (beton.get(i).get(j).ypos+5)) {
            m.get(0).ypos = -1;
            m.get(0).xpos = -1;
            
          }  
        }
      }
    }   
  }  
  
  
  
  
  void checkHitAlienMisile(Alienmisile m) {
    for(ArrayList<Beton> row: beton) {
      for(int i = 0; i < row.size()-1; i++) {
        Beton b = row.get(i);
        if(m.xpos >= b.xpos && m.xpos <= b.xpos+5 && m.ypos+30 >= b.ypos && m.ypos < 1200) {
            hitXpos = b.xpos;
            row.remove(i);
            if(row.size()>i) {
              Beton c = row.get(i);
              if(b.xpos+5 == c.xpos) {
                row.remove(i);
              }
            }
            if(i>0) {
              Beton a = row.get(i-1);
              if(a.xpos+5 == b.xpos) {
                row.remove(i-1);
              }
            }  
            m.ypos = 1305;
            alienmisileHitBunker = true;
        } 
      }
    }      
  }  

}  
         
    
