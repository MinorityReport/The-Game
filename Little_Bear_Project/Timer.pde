class Timer {
  int time, currentTime, oldTime;

  Timer(int time_) {
    time=time_;
    currentTime=millis();
    oldTime=currentTime;
  }
  Timer(int time_, int oldTime_) {
    time=time_;
    currentTime=millis();
    oldTime=currentTime+oldTime_;
  }

  void update() {
    currentTime= millis();
  }

  boolean checkTime() {
    if (currentTime-oldTime>=time) {
      oldTime=currentTime;
      return true;
    }
    else {
      return false;
    }
  }
}

