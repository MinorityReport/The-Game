class Platforms {
  float x, y, ys, l;
  color c;

  Platforms(float tx) {
    x=tx;
    y=0;
    l= random(100, 150);
    ys= 2;
    c= color(14,29,157);
  }

  void display() {
    rectMode(CENTER);
    fill(c);
    rect(x, y, l, 10);
  }

  void move() {
    y+=ys;
  }
}

