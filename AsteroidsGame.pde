//your variable declarations here
Spaceship ship;
SpaceshipBack shipBackground;
Star [] stars;
ArrayList <Asteroid> asteroids = new ArrayList <Asteroid>();
//Bullet [] bullets;
public void setup() 
{
  background(0);
  size(800,800);
  ship = new Spaceship();
  shipBackground = new SpaceshipBack();
  stars = new Star[1000];
  for(int i = 0; i < 1000; i++){
    stars[i] = new Star();
  }
  for (int i = 0; i < 20; i++) {
    asteroids.add(i, new Asteroid());
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
  shipBackground.show();
  shipBackground.move();
  //ship
  ship.show();
  ship.move();

  for (int i = 0; i < asteroids.size(); i++) {
    Asteroid a = asteroids.get(i);
    asteroids.get(i).show();
    asteroids.get(i).move();

//collision
    float d = dist((float)a.getX(), (float)a.getY(),(float)ship.myCenterX, (float)ship.myCenterY);
    if (d < 25){
      asteroids.remove(i);
    }
  }
}

public void keyPressed(){
  if(key == 'w'){ship.accelerate(.2); shipBackground.accelerate(.2);}
  if(key == 's')
  {ship.accelerate(-.02);shipBackground.accelerate(-.02);}
  if(key == 'a'){ship.myPointDirection -=10; shipBackground.myPointDirection -=10;}
  if(key == 'd'){ship.myPointDirection +=10; shipBackground.myPointDirection +=10;}

  if(key == 'q'){
    ship.setSpeed(0,0);
    ship.setPosition((int)(Math.random()*600)+100,(int)(Math.random()*600)+100);
    shipBackground.setSpeed(0,0); 
    shipBackground.myCenterX = ship.myCenterX; shipBackground.myCenterY = ship.myCenterY;
    ship.setDirection((int)(Math.random()*360)); shipBackground.myPointDirection = ship.myPointDirection;
  }
}
