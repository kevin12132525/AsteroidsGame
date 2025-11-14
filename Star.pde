class Star //note that this class does NOT extend Floater
{
  private int myX, myY;
  //your code here
  public Star(){
    myX = (int)(Math.random()*800);
    myY = (int)(Math.random()*800);
  }
  public int getX() {return myX;}
  public int getY() {return myY;}
  
  public void show(){
    ellipse(float(myX),float(myY),1,1);
  }
}
