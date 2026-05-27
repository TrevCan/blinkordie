public class ProgressBar {
  int x;
  int y;
  int _width;
  int _height;
  float progress;

  public ProgressBar(int x, int y, int _width, int _height) {
    this.x = x;
    this.y = y;
    this._width = _width;
    this._height = _height;
    this.progress = 1;
  }

  public void setProgress(float progress) {
    if (progress < 0) {
      progress = 0;
    }
    this.progress = progress;
  }

  public float getProgress() {
    return this.progress;
  }

  public void show() {
    rectMode(CORNER);
    stroke(255);
    strokeWeight(5);
    noFill();
    rect(this.x, this.y, this._width, this._height);
    noStroke();
    fill(0, 255, 0);
    rect(this.x, this.y, this._width * this.progress, this._height);
  }
}
