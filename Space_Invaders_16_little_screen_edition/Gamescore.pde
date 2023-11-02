class Gamescore {
 int score;
 String date;
 int hour;
 int minute;
 int day;
 int month;
 int year;
 
Gamescore(int score, int day, int month, int year, int hour, int minute) {
  this.score = score;
  this.day = day;
  this.month = month;
  this.year = year;
  this.hour = hour;
  this.minute = minute;
}

String getDate() {
  return date;
}
int getDay() {
  return day;
}
int getMonth() {
  return month;
}
int getYear() {
  return year;
}

int getHour() {
  return hour;
}

int getMinute() {
  return minute;
}

int getScore() {
  return score;
}

}

//date = day()+"."+month()+"."+year();
//time = hour()+":"+minute()+":"+second();
