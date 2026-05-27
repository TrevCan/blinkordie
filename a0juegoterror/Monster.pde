public class Monster {

  PImage default_pose, left, right;

  POSE current_pose;
  
  int x, y, x_left, y_left, x_right, y_right;


  public Monster() {
    default_pose = loadImage("default_pose.png");
    left = loadImage("left.png");
    right = loadImage("right.png");
    
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
      image(left, x, y);
      break;
    case RIGHT:
      image(right, x, y);
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
};
