class Spaceship extends Floater  
{   
 //your code here
 private double myHealth;
 private double myScore;
 public Spaceship(){
   corners = 7;
   xCorners = new int[]{-20,-15,-15,-20, 2, 20, 2};   
   yCorners = new int[]{-15,-8, 8, 15, 3, 0, -3};   
   myColor = 100;
   myCenterX = 400;
   myCenterY = 400;
   myXspeed = 0;
   myYspeed = 0;
   myPointDirection = 45;
   myHealth = 100;
 }
   public void setPosition(double x, double y) {
    myCenterX = x;
    myCenterY = y;
  }
  public void setDirection(double d) {
    myPointDirection = d;
  }
  public void setCorners(int c) {
    corners = c;
  }
  public void setmyColor(int c) {
    myColor = c;
  }
  public void setSpeed(double xs, double ys) {
    myXspeed = xs;
    myYspeed = ys;
  }
  public void setHealth(double health) {
    myHealth = health;
  }
  public void setScore(double s){
    myScore = s;
  }

  public double getX() { return myCenterX; }
  public double getY() { return myCenterY; }
  public double getXspeed() { return myXspeed; }
  public double getYspeed() { return myYspeed; }
  public double getDirection() { return myPointDirection; }
  public double getHealth() { return myHealth; }
  public double getScore()  { return myScore; }

   public void hyperspace() {
    setSpeed(0,0);
    setPosition((int)(Math.random()*600)+100,(int)(Math.random()*600)+100);
    setDirection((int)(Math.random()*360));
  }
}

class SpaceshipBack extends Spaceship  
{   
    //your code here
    public SpaceshipBack(){
    setCorners(5);
    xCorners = new int[]{-24,-18,-18,-23, 23};   
    yCorners = new int[]{-18,-11, 11, 18, 0};   
    setmyColor(255);
  }
}
