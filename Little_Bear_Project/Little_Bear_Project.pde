int x = 200;
int y = 200;
boolean startGame = false;
boolean startTime = false;
boolean endGame = false;
boolean instructions = false;
Bear p1;
boolean right = false, left = false, up = false, down = false;
PFont ravie;
ArrayList platforms= new ArrayList();
ArrayList morePlatforms= new ArrayList();
ArrayList spikes = new ArrayList();
ArrayList moreSpikes = new ArrayList();
Timer time1;
Timer time2;
PImage cloud;
void setup() {
  size(400, 400);
  ravie = loadFont("Ravie-50.vlw");
  p1 = new Bear(width/2, height/2);
  platforms.add(new Platforms(random(width/2)));
  morePlatforms.add(new Platforms(random(width/2, width)));
  time1= new Timer(1500);
  time2= new Timer(1500, 750);
  cloud= loadImage( "cloud.jpg");
}
void draw() {
  background(0, 180, 200);
  if (startGame == false) {
    pushMatrix();
    textSize(45);
    fill(175, 277, 103);
    textFont(ravie, 45);
    text("JUMP JUMP!", 15, 100);
    popMatrix();
    pushMatrix();
    textSize(15);
    text("INSTRUCTIONS", 50, 300);
    popMatrix();
    text("PLAY", 300, 300);
    rectMode(CENTER);
    fill(240, 190, 50);
    noStroke();
    ellipse(x, y -16, 20, 20);
    //head
    ellipse(x, y, 32, 32);
    //body
    ellipse(x+6, y-24, 8, 8);
    ellipse(x-6, y-24, 8, 8);
    //the ears
    rect(x-6, y+16, 8, 8);
    rect(x+6, y+16, 8, 8);
    //the feet
    fill(0);
    stroke(3);
    ellipse(x+6, y-20, 2, 2);
    ellipse(x-6, y-20, 2, 2);
    //eyes
    noStroke();
    fill(255, 255, 0);
    ellipse(x, y, 20, 20);
    pushMatrix();
    stroke(0);
    strokeWeight(1);
    line(x+18, y-22, x+26, y-34);
    line(x+18, y-22, x+35, y-30);
    fill(0, 180, 200);
    ellipse(x+50, y-47, 60, 40);
    popMatrix();
    pushMatrix();
    fill(0);
    textSize(10);
    text("Let's", x+35, y-50);
    text("jump!", x+35, y-40);
    popMatrix();
  }
  else if (startGame == true) {
    background(255);
    image(cloud, width/2, height/4, 50, 50);
    image(cloud, width/4, height/6, 50, 50);
    image(cloud, width/6, 3*height/4, 80, 80);
    image(cloud, 2*width/3, height/9, 75, 75);
    p1.move();
    p1.display();
    for (int i=0; i< platforms.size(); i++) {
      Platforms platform= (Platforms) platforms.get(i);
      platform.display();
      platform.move();
      p1.check(platform);
      if (platform.y> height) {
        platforms.remove(i);
      }
    }
    for (int i=0; i< morePlatforms.size(); i++) {
      Platforms platform= (Platforms) morePlatforms.get(i);
      platform.display();
      platform.move();
        p1.check(platform);
      if (platform.y> height) {
        morePlatforms.remove(i);
      }
    }

    time1.update();
    time2.update();
    if (time1.checkTime()== true) {
      platforms.add(new Platforms(random(width/2)));
    }
    if (time2.checkTime()== true) {
      morePlatforms.add(new Platforms(random(width/2, width)));
    }
  }
  else if (endGame == true) {
  }
  else if (instructions == true) {
  }
}
void mousePressed() {
  if ((mouseX > 300) &&(mouseX < 353) &&(mouseY > 285) &&(mouseY < 300)) {
    if (startGame == false) {
      startGame = true;
      //326,295,53,15
    }
    else if (startGame == true) {
      startGame = false;
      endGame = false;
    }
  }
}

void keyPressed() {
  switch(keyCode) {
  case RIGHT: 
    right = true; 
    break;
  case LEFT: 
    left = true; 
    break;
  case UP: 
    up = true; 
    break;
  case DOWN: 
    down = true; 
    break;
  }
}

void keyReleased() {
  switch(keyCode) {
  case RIGHT: 
    right = false; 
    break;
  case LEFT: 
    left = false; 
    break;
  case UP: 
    up = false; 
    break;
  case DOWN: 
    down = false; 
    break;
  }
}

