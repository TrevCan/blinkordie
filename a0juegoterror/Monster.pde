public class Monster {

  PImage default_pose, left, right, cama, screamer;

  POSE current_pose;
  
  int x, y, x_left, y_left, x_right, y_right,
    x_cama, y_cama, x_screamer, y_screamer;


  public Monster() {
    default_pose = loadImage("Monstruo.png");
    left = loadImage("Monstruo Izquierda.png");
    right = loadImage("Monstruo Derecha.png");
    cama = loadImage("Monstruo Cama.png");
    screamer = loadImage("Screamer.png");
    
    default_pose.resize(500, 0);
    left.resize(500, 0);
    right.resize(500, 0);
    
    x = width/2;
    y = height/2;
        
    x_left = width/2 - 100;
    y_left = height/2;
        
    x_right = width/2 + 100;
    y_right = height/2;

    current_pose = POSE.CENTER;
  }

  public void show() {
    
    imageMode(CENTER);
    switch(current_pose) {

    case LEFT:
      image(left, x_left, y_left);
      break;
    case RIGHT:
      image(right, x_right, y_right);
      break;
    case CAMA:
      image(cama, x_cama, y_cama);
      break;
    case SCREAMER:
      imageMode(CORNER);
      image(screamer, 0, 0);
      break;

    default:
    case CENTER:
      image(default_pose, x, y);
      break;
    }
  }

  public void setPose(POSE pose) {
    this.current_pose = pose;
  }

  public POSE getPose() {
    return this.current_pose;
  }
}

public enum POSE {
  CENTER,
    LEFT,
    RIGHT,
    CAMA,
    SCREAMER
};
