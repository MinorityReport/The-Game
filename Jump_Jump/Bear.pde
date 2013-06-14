class Bear {
  float  x, y;
  float gravity;
  float xSpeed, ySpeed;

  Bear(int tx, int ty ) {
    x = width/2;
    y = height/2-100;
    gravity = 0.4;
    xSpeed = 0;
    ySpeed = 0;
  }
  void move() {
    if (right) {
      x+=3;
    } else if (left) {
      x-=3;
    }
    if ( y >= 390 ) {
      ySpeed=0;
    }
    if (up && (ySpeed==0 || ySpeed ==2)) {
      ySpeed = -10;
    }
    y += ySpeed;
    ySpeed += gravity;
  }
  void display() {
    if (down) {
      noStroke();
      fill(240, 190, 50);
      ellipse(x+3, y-4, 4, 2.5);
      ellipse(x-3, y-4, 4, 2.5);
      //ears
      ellipse(x, y -2, 10, 5);
      //head
      ellipse(x, y+4, 16, 10);
      //body
      rect(x-3, y+8, 4, 2);
      rect(x+3, y+8, 4, 2);
      //feet
      fill(255, 255, 0);
      ellipse(x, y+4, 10, 5);
      //yellow belly
      fill(0);
      stroke(3);
      point(x+2.5, y-2.5);
      point(x-2.5, y-2.5);
      //eyes
    } else {
      rectMode(CENTER);
      fill(240, 190, 50);
      noStroke();
      ellipse(x, y -8, 10, 10);
      //head
      ellipse(x, y, 16, 16);
      //body
      ellipse(x+3, y-12, 4, 4);
      ellipse(x-3, y-12, 4, 4);
      //the ears
      rect(x-3, y+8, 4, 4);
      rect(x+3, y+8, 4, 4);
      //the feet
      fill(0);
      stroke(3);
      point(x+3, y-10);
      point(x-3, y-10);
      //eyes
      noStroke();
      fill(255, 255, 0);
      ellipse(x, y, 10, 10);
    }
  }
  void check(Platforms p) {
    if (x> p.x1 && x< p.x1+p.l && y-12 <p.y1 && y+10>p.y1 && ySpeed>0) {
      print("TOUCH!");
      ySpeed = p.ys;
    } else {
      print("...");
    }
    if (x>p.x2 && x<p.x2+p.l && y-12<p.y2 && y+10> p.y2 && ySpeed>0) {
      print("TOUCH!");
      ySpeed = p.ys;
    } else {
      print("...");
    }
  }
  
 boolean check(Spikes s){
   if(x > width-50 && x < width && y < s.y+20 && y > s.y){
    return true;
     } 
   else {
   return false; 
  }
//     if(x > ){
//    return true;
//   } 
//   else {
//   return false; 
//  }
}


    boolean loser() {
      if (y>= height || x<0 || x>width) {
        return true;
      } else {
        return false;
      }
    }
  }

