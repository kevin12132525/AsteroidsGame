class Asteroid extends Floater {
  private double rotationSpeed;
  
  Asteroid(){
     corners = 8;
     xCorners = new int[]{20, 14, 0, -13, -18, -14, 0, 12};
     yCorners = new int[]{0, -13, -21, -14, 0, 15, 22, 15};
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
}
