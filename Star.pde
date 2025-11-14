class Star //note that this class does NOT extend Floater
{
  int myX, myY;
  //your code here
  public Star(){
    myX = (int)(Math.random()*800);
    myY = (int)(Math.random()*800);
  }
  public void show(){
    ellipse(float(myX),float(myY),1,1);
  }
}
