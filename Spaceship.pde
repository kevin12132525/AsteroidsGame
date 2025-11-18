class Spaceship extends Floater  
{   
 //your code here
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

  public double getX() { return myCenterX; }
  public double getY() { return myCenterY; }
  public double getDirection() { return myPointDirection; }

   public void hyperspace() {
    setSpeed(0,0);
    setPosition((int)(Math.random()*600)+100,(int)(Math.random()*600)+100);
    setDirection((int)(Math.random()*360));
  }
}
/*
  public void shoot(){
    if(key == 'r'){
      bullets = new Bullet[1000];
      for(int i = 0; i < 1000; i++){
          bullets[i] = new Bullet();
      }    
    }
  }
*/

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
/*
class Bullet extends Spaceship
{
  public Bullet(){
  corners = 4;
  xCorners = new int []{-2,-2,2,2};
  yCorners = new int []{-2,2,2,-2};
  myColor = 255;
  
  }
}
*/
