class Spikes {
  float y;
  color c;

  Spikes(float ty) {
    y=ty;
    c= color(75);
  }

  void display() {
    fill(c);
    triangle(0, y, 0, y+20, 50, y+10);
    triangle(width, y, width, y+20, width-50, y+10);
  }

  void move() {
    y++;

  }

}

