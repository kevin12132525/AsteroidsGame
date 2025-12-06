class Bullet extends Floater{
  private int life = 60 * 2/*seconds*/;
  private int diameter = 4;
  Bullet(Spaceship ship){
    myCenterX = ship.getX();   
    myCenterY = ship.getY();     
    myXspeed = ship.getXspeed();
    myYspeed = ship.getYspeed();
    myPointDirection = ship.getDirection();
    myColor = 255;
    accelerate(6.0);
  }
  public void show(){
    fill(myColor);
    ellipse((float)myCenterX, (float)myCenterY, diameter,diameter);
  }
  public void update() {
    move();
    show();
    life--;
  }
  public boolean isDead(){
    return life <= 0;
  }
  public double getX() { return myCenterX; }
  public double getY() { return myCenterY; }
}
