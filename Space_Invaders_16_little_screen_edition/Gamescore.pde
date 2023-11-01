class Gamescore {
 int score;
 String date;
 String time;

Gamescore(int score, String date, String time) {
  this.score = score;
  this.date = date;
  this.time = time;
}

String getDate() {
  return date;
}

String getTime() {
  return time;
}

int getScore() {
  return score;
}

}

//date = day()+"."+month()+"."+year();
//time = hour()+":"+minute()+":"+second();
