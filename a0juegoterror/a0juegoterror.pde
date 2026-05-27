import java.util.Timer;
import java.util.TimerTask;
import java.util.Random;

boolean clicked = false;
Button button;
ProgressBar bar;

boolean first = true;
int first_time = 0;
int target_time = 5000;
TimerTask task0;
Timer timer;


int scene = 0;

TimerTask task_chooseRandomPose;
Monster monster;

Random random;

void setup() {
  size(500, 500);
  random = new Random();
  color c = color(255, 0, 0);
  button = new Button(width*0.3, height*0.8, (int) (width*0.3), (int) (height*0.2), c);
  bar = new ProgressBar(50, 50, 100, 30);

  monster = new Monster();

  timer = new Timer();
  task0 = new TimerTask() {
    public void run() {
      System.out.println("Hello, world!");
    }
  };

  task_chooseRandomPose = new TimerTask() {
    public void run() {
      int randomto2 = random.nextInt(3);

      if (randomto2 == 0) {
        monster.setPose(POSE.CENTER);
      } else if ( randomto2 == 1) {
        monster.setPose(POSE.LEFT);
      } else {
        monster.setPose(POSE.RIGHT);
      }
    }
  };
}

void draw() {
  switch(scene) {
  case 0:

    background(0);
    button.show();
    break;
  case 1:
    background(0);
    if (first == true) {
      first_time = millis();
      first = false;
      int randomWait = random.nextInt(0, 5001);
      timer.schedule(task_chooseRandomPose, randomWait, 1000);
    }

    float progress = bar.getProgress() - 0.0005;
    bar.setProgress( progress );
    bar.show();

    monster.show();


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
}

void keyPressed() {
  if (key == ' ' && scene == 1 && monster.getPose() != POSE.CENTER) {
    bar.setProgress(bar.getProgress() + 0.2);
  } else if (key == ' ' && scene == 1 && monster.getPose() == POSE.CENTER) {
    bar.setProgress(bar.getProgress() - 0.2);
  }
}
