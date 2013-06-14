float x = 200;
float y = 200;
boolean startGame = false;
boolean endGame = false;
boolean instructions = false;
boolean right = false, left = false, up = false, down = false;
PFont ravie;
ArrayList platforms= new ArrayList();
ArrayList spikes= new ArrayList();
Timer timePlatform;
Timer timeSpike;
Timer yStart;
Timer level;
Bear p1;
Cloud[]clouds= new Cloud[4];
int t=1000;
int ystart = 201;
int a=1;
int yspeed=2;

void setup() {
  size(400, 400);
  ravie = loadFont("Ravie-48.vlw");
  p1 = new Bear(width/2, height/2);
  for (int i=0; i<4; i++) {
    clouds[i]= new Cloud(random(width), random(height), random(50, 70));
    clouds[i].load();
  }
  platforms.add(new Platforms());
  spikes.add(new Spikes(0));
  timePlatform= new Timer(1500);
  timeSpike= new Timer(t);
  yStart = new Timer(3000);
  level= new Timer(10000);
}

void draw() {
  background(0, 180, 200);
  timePlatform.update();
  timeSpike.update();
  if (startGame == false) {
    textSize(45);
    fill(175, 277, 103);
    textFont(ravie, 45);
    text("JUMP JUMP!", 15, 100);
    textSize(15);
    text("INSTRUCTIONS", 50, 300);
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
    stroke(0);
    strokeWeight(1);
    line(x+18, y-22, x+26, y-34);
    line(x+18, y-22, x+35, y-30);
    fill(0, 180, 200);
    ellipse(x+50, y-47, 60, 40);
    fill(0);
    textSize(10);
    text("Let's", x+35, y-50);
    text("jump!", x+35, y-40);
  } else if (startGame == true) {

    yStart.update();
    background(161, 227, 252);

    for (int i=0; i<4; i++) {
      clouds[i].display();
      clouds[i].move();
    }
    p1.move();
    p1.display();
    for (int i=0; i<platforms.size(); i++) {
      Platforms platform= (Platforms) platforms.get(i);
      platform.display();
      platform.move();
      p1.check(platform);
      if (platform.y2> height) {
        platforms.remove(i);
      }
      if (timePlatform.checkTime()== true) {
        platforms.add(new Platforms());
      }
      if (level.checkTime()==true) {
        a++;
        yspeed+=.75;

//        for (int k = 0; k<platforms.size(); k++) {
//          Platforms p = (Platforms)platforms.get(k);
//          p.moveFaster();
//        }
      }
      //      if(millis()>20000 && millis()<40000){
      //        platform.moveFaster();

      //      }
    }
    for (int i=0; i< spikes.size(); i++) {
      Spikes spike= (Spikes) spikes.get(i);
      spike.display();
      spike.move();
      if (p1.check(spike) == true || p1.y+12>height) {
        endGame = true;
      }
      if (spike.y>height) {
        spikes.remove(i);
        print("remove spike");
        t-=5;
      }
    }
    if (timeSpike.checkTime()==true) {
      print("new spike");
      spikes.add(new Spikes(0));
    }
    fill(240, 27, 80);
    rect(150, ystart, 100, 10);
    if (yStart.checkTime()==true) {
      ystart+= 50;
    }

    if (p1.x> 150 && p1.x< 250 && p1.y-12 <ystart && p1.y+10>ystart && p1.ySpeed>0) {
      print("TOUCH!");
      p1.ySpeed = 0;
    }
    textSize(20);
    text("Level", 0, 30);
    text(a, 75, 30);

    level.update();
  }

  if (endGame == true) {
    startGame = false;
    background(0);
    rectMode(CENTER);
    fill(240, 190, 50);
    noStroke();
    ellipse(x, y -32, 40, 40);
    //head
    ellipse(x, y, 64, 64);
    //body
    ellipse(x+12, y-48, 16, 16);
    ellipse(x-12, y-48, 16, 16);
    //the ears
    rect(x-12, y+32, 16, 16);
    rect(x+12, y+32, 16, 16);
    //the feet
    fill(121, 26, 216);
    ellipse(x+12, y-40, 12, 12);
    fill(0);
    stroke(3);
    ellipse(x+12, y-40, 4, 4);
    ellipse(x-12, y-40, 4, 4);


    //eyes
    noStroke();
    fill(255, 255, 0);
    ellipse(x, y, 50, 50);
    stroke(255);
    strokeWeight(1);
    line(x+24, y-44, x+52, y-68);
    line(x+24, y-44, x+70, y-60);
    fill(0);
    ellipse(x+80, y-77, 90, 70);
    noFill();
    stroke(0);
    arc(x, y-28, 20, 20, PI, 2*PI, OPEN);
    pushMatrix();
    fill(255, 0, 0);
    textSize(45);
    text("GAME OVER!", 15, 50);
    popMatrix();
    line(192, 187, 201, 201);
    line(198, 189, 192, 191);
    line(200, 194, 194, 195);
    line(202, 198, 196, 200);
    textSize(20);
    text("Oh no!", 242, 131);
    text("You reached:", 120, 296);
    text("Level", 161, 345);
    text(a, 236, 345);
  } 
  if (instructions == true) {

    background(240, 190, 50);
    textSize(45);
    fill(0, 180, 200);
    textFont(ravie, 45);
    text("Instructions", 6, 100);
    textSize(20);
    ellipse(22, 276, 10, 10);
    ellipse(22, 207, 10, 10);
    ellipse(22, 145, 10, 10);
    text("Use the arrow keys", 32, 217);
    text(" to move.", 32, 237);
    text("Don't touch the spikes!", 32, 286);
    text("Try to reach the top!", 32, 155);

    text("Start Game!", 106, 360);
  }
  println(millis()/1000);
}


void mousePressed() {
  if ((mouseX > 300) &&(mouseX < 353) &&(mouseY > 285) &&(mouseY < 300)) {
    if (startGame == false) {
      startGame = true;
      //326,295,53,15
    } else if (startGame == true) {
      startGame = false;
      endGame = false;
    }
  }
  if ((mouseX > 106) && (mouseX < 273) && (mouseY < 360) && (mouseY > 342)) {
    if (instructions == true) {
      startGame = true;
      instructions =false;
    }
  }  
  if ((mouseX < 192) && (mouseX >50) && (mouseY < 300) && (mouseY > 288)) {
    if (instructions == false) {
      instructions = true;
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

