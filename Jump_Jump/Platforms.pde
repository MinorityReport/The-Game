class Platforms {
  float x1, x2, y1, y2, ys, l;
  color c; 

  Platforms() {
    x1= random(width/2);
    l= random(100, 150);
    x2= random(width/2, width-l/2);
    y1=0;
    y2=-75;
    ys= 2;
    c=color(240, 27, 80);
  }

  void display() {
    rectMode(CORNER);
    fill(c);
    rect(x1, y1, l, 10);
    rect(x2, y2, l, 10);
  }

  void move() {
    y1+=yspeed;
    y2+=yspeed;
  }
  void moveFaster() {
    ys+=1;
  }
}

