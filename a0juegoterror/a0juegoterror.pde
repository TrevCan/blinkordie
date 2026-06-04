import java.util.Timer;
import java.util.TimerTask;
import java.util.Random;
import processing.sound.*;

SoundFile intro_music;
SoundFile main_music;
SoundFile screamer_music;
SoundFile win_music;

boolean clicked = false;
Button button;
ProgressBar bar;

boolean first = true;
int first_time = 0;
int target_time = 5000;
TimerTask task0;
Timer timer;

PImage menu_image;
PImage background_image;
PImage bed_image;
PImage win_image;


int scene = 0;

TimerTask task_change_to_win_scene;


TimerTask task_chooseRandomPose;
Monster monster;

Random random;

float progress_speed = 0.0005;

void setup() {

  fullScreen();

  intro_music = new SoundFile(this, "menu.mp3");
  main_music = new SoundFile(this, "main.mp3");
  screamer_music = new SoundFile(this, "screamer.mp3");
  win_music = new SoundFile(this, "win.mp3");

  intro_music.play();
  random = new Random();
  color c = color(90, 10, 20);
  button = new Button(width/2-width*0.3 + width*0.15, 614, (int) (width*0.3), (int) (height*0.2), c);
  bar = new ProgressBar(50, 50, 100, 30);
  background_image = loadImage("Fondo00.png");
  bed_image = loadImage("Fondo01.png");
  win_image = loadImage("win.png");
  win_image.resize(width, 0);

  menu_image = loadImage("menu.png");
  menu_image.resize(width, 0);

  println(width);
  println(height);
  background_image.resize(width, 0);
  bed_image.resize(width+9, 0);




  monster = new Monster();

  timer = new Timer();
  task0 = new TimerTask() {
    public void run() {
      System.out.println("Hello, world!");
    }
  };

  task_chooseRandomPose = new TimerTask() {
    public void run() {
      if (bar.getProgress() <= 0.1) {
        monster.setPose(POSE.SCREAMER);
        screamer_music.play();
      } else if (bar.getProgress() > 0.1 && bar.getProgress() < 0.5) {
        monster.setPose(POSE.CAMA);
        progress_speed = 0.01;
      } else {

        int randomto2 = random.nextInt(4);



        if (randomto2 == 0 || randomto2 == 3) {
          monster.setPose(POSE.CENTER);
        } else if ( randomto2 == 1) {
          monster.setPose(POSE.LEFT);
        } else {
          monster.setPose(POSE.RIGHT);
        }
      }
    }
  };


  task_change_to_win_scene = new TimerTask() {
    public void run() {
      if (monster.getPose() != POSE.SCREAMER) {
        scene = 2;
      }
    }
  };
}

void draw() {
  switch(scene) {
  case 0:
    background(0);

    imageMode(CORNER);
    image(menu_image, 0, 0);
    button.show();
    textAlign(CENTER);
    textSize(80);
    fill(0);
    text("START", width/2, height-60);
    break;
  case 1:
    background(0);
    imageMode(CORNER);
    image(background_image, 0, 0);
    if (first == true) {
      intro_music.pause();
      main_music.loop();
      first_time = millis();
      first = false;
      int randomWait = random.nextInt(0, 5001);
      timer.schedule(task_chooseRandomPose, randomWait, 400);
      timer.schedule(task_change_to_win_scene, 30000);
    }

    float progress = bar.getProgress() - progress_speed ;
    bar.setProgress( progress );
    bar.show();

    monster.show();

    imageMode(CORNER);
    image(bed_image, 0, -7);
    stroke(0);
    strokeWeight(10);
    line(0, height, width, height);


    break;

  case 2:
    imageMode(CORNER);
    image(win_image, 0, 0);
    screamer_music.pause();
    win_music.play();
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

void keyReleased() {
  if ( monster.getPose() != POSE.SCREAMER || monster.getPose() != POSE.CAMA) {

    if (key == ' ') {
      background(255, 0, 0);
    }
    if (key == ' ' && scene == 1 && monster.getPose() != POSE.CENTER) {
      bar.setProgress(bar.getProgress() + 0.05);
    } else if (key == ' ' && scene == 1 && monster.getPose() == POSE.CENTER) {
      bar.setProgress(bar.getProgress() - 0.07);
    }
  }
}
