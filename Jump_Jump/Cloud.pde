class Cloud{
  float x,y,w,l;
  PImage cloud;
  
  Cloud(float tx,float ty, float tw){
    x=tx;
    y=ty;
    w=tw;
  }
  
  void load(){
    cloud= loadImage("cloud.gif");
  }
    
  void display(){
    imageMode(CENTER);
    image(cloud,x,y,2*w,w);
  }
  
  void move(){
    y++;
    if(y>height+l){
      y=0-l;
      x= random(width);
    }
  }
}
