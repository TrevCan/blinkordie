public class Button {
  float x;
  float y;
  int b_width;
  int b_height;
  color b_color;

  public Button(float x, float y, int b_width, int b_height, int b_color) {
    this.x = x;
    this.y = y;
    this.b_width = b_width;
    this.b_height = b_height;
    this.b_color = b_color;
  }

  public void changeColor(int b_color) {
    this.b_color = b_color;
  }

  public void show() {
    rectMode(CORNER);
    noStroke();
    fill(b_color);
    rect(this.x, this.y, this.b_width, this.b_height);
  }

  public boolean isPressed() {
    return mouseX >= this.x && mouseX <= this.x+this.b_width
      && mouseY >= this.y && mouseY <= this.y+this.b_height;
  }
}
