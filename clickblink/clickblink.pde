int x, y;
boolean blink, isDead;


int start_time, end_time;

int score;

void setup() {
  size(500, 500);
  x = width/2;
  y = 20;

  blink = false;
  isDead = false;
  score = 0;
}

void draw() {
  background(0);

  if (mousePressed && blink) {
    score++;
    score++;
  }
  score = score - 1;

  if (blink == false) {

    int x = int(random(0, 10));
    println(x);
    if ( x >= 9) {
      blink = true;
      start_time = millis();
      end_time = start_time + 3000;
    } else {
      blink = false;
    }
  } else {
    textSize(128);
    text("close eyes", width/2, height/2);
    if (millis()>= end_time && blink==true) {
      blink = false;
    }
  }

  circle(x, y, 50);

  text(score, width/2, height/4);
}

/*void mouseReleased(){
 if(blink == true){
 score++;
 }
 println(score);
 }*/
