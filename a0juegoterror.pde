boolean clicked = false;
Button button;
ProgressBar bar;

boolean first = true;
int first_time = 0;

int scene = 0;

void setup() {
  size(500, 500);
  color c = color(255, 0, 0);
  button = new Button(width*0.3, height*0.8, (int) (width*0.3), (int) (height*0.2), c);
  bar = new ProgressBar(50, 50, 100, 30);
}

void draw() {
  switch(scene) {
  case 0:

    background(0);
    button.show();
    break;
  case 1:
    if (first == true) {
      first = false;
      first_time = millis();
    }
    background(0);
    int millis_delta = millis() - first_time;
    int seconds = millis_delta / 1000;
    float progress = 1.0 - seconds*0.01;
    bar.setProgress( progress );
    bar.show();

    break;
  default:
    background(0);
  }
}

void mouseReleased() {

  if (scene == 0) {
    if (button.isPressed()) {
      button.changeColor(color(0, 0, 255));
      // change to scene 1
      scene = 1;
    }
  }
  if (scene == 1) {
    println("Close eyes");
  }
}
