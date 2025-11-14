//your variable declarations here
Spaceship bob;
SpaceshipBack bobBackground;
Star [] stars;
//Bullet [] bullets;
public void setup() 
{
  background(0);
  size(800,800);
  bob = new Spaceship();
  bobBackground = new SpaceshipBack();
  stars = new Star[1000];
  for(int i = 0; i < 1000; i++){
    stars[i] = new Star();
  }

  keyPressed();
}
public void draw() 
{
  background(0);
  //background stars
  for(int i = 0; i < 1000; i++){
    stars[i].show();
  }
  //ship outline
  bobBackground.show();
  bobBackground.move();
  //ship
  bob.show();
  bob.move();
  
  
}
public void keyPressed() {
  if (key == 'w') { bob.accelerate(.4); bobBackground.accelerate(.4); }
  if (key == 's') { bob.accelerate(-.04); bobBackground.accelerate(-.04); }
  if (key == 'a') { bob.turn(-10); bobBackground.turn(-10); }
  if (key == 'd') { bob.turn(10); bobBackground.turn(10); }

  if (key == 'q') {
    bob.hyperspace();
    bobBackground.setSpeed(0,0);
    bobBackground.setPosition(bob.getX(),bob.getY());
    bobBackground.setDirection(bob.getDirection());
  }
}
