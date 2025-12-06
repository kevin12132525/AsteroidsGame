class Asteroid extends Floater {
  private double rotationSpeed;
  
  Asteroid(){
  corners = 8;
  xCorners = new int[]{20, 14, 0, -13, -18, -14, 0, 12};
  yCorners = new int[]{0, -13, -21, -14, 0, 15, 22, 15};
  
//randomness
  for (int i = 0; i < corners; i++) {
    xCorners[i] += (int)(Math.random() * 10 - 5); 
    yCorners[i] += (int)(Math.random() * 10 - 5); 
  }
     myColor = 210;
     myCenterX = (int)(Math.random()*750);
     myCenterY = (int)(Math.random()*750);
//drifting
     myXspeed = (Math.random()*1.1) - .5;   
     myYspeed = (Math.random()*1.1) - .5;
     
     myPointDirection = (Math.random()*360);
     rotationSpeed = (Math.random()*2)-1;
     
  }
  public void move(){
    myPointDirection +=rotationSpeed;
    myCenterX = myCenterX + myXspeed;
    myCenterY = myCenterY + myYspeed;
//stay on screen
  if (myCenterX >width)
      myCenterX = 0;
    else if (myCenterX<0)
      myCenterX = width;
    if (myCenterY >height)
      myCenterY = 0;
    else if (myCenterY < 0)
      myCenterY = height;
  }
  public void setPosition(double x, double y) {
    myCenterX = x;
    myCenterY = y;
  }
  public double getX(){return myCenterX;}
  public double getY(){return myCenterY;}
  public double getXspeed() { return myXspeed; }
  public double getYspeed() { return myYspeed; }
  public void setSpeed(double xs, double ys){
    myXspeed = xs;
    myYspeed = ys;
  }
  public void setDirection(double d){
    myPointDirection = d;
  }
}

class SmallAsteroid extends Asteroid {
  SmallAsteroid(){
    xCorners = new int[]{15, 9, 0, -8, -13, -9, 0, 12};
    yCorners = new int[]{0, -8, -14, -9, 0, 10, 15, 10};
  }
}
