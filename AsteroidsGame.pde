//your variable declarations here
Spaceship ship;
SpaceshipBack shipBack;
Star [] stars;
ArrayList <Asteroid> asteroids = new ArrayList <Asteroid>();
ArrayList <Bullet> bullets = new ArrayList <Bullet>();
ArrayList <SmallAsteroid> smallasteroids = new ArrayList <SmallAsteroid>();
int textRed = 0;
int textGreen = 255;
public void setup()
{
  background(0);
  size(800, 800);
  ship = new Spaceship();
  shipBack = new SpaceshipBack();
  stars = new Star[1000];
  for (int i = 0; i < 1000; i++) {
    stars[i] = new Star();
  }
  for (int i = 0; i < 20; i++) {
    asteroids.add(i, new Asteroid());
  }
  for (int i = 0; i < 5; i++) {
    smallasteroids.add(i, new SmallAsteroid());
  }
}
public void draw()
{
  background(0);
  //background stars
  for (int i = 0; i < 1000; i++) {
    stars[i].show();
  }

  //text
  textSize(48);
  fill(textRed, textGreen, 0);
  text("Health:" + (int)ship.getHealth(), 40, 60);
  fill(0, 0, 200);
  text("Score:" + (int)ship.getScore(), 40, 110);

  //ship outline
  shipBack.show();
  shipBack.move();
  //ship
  ship.show();
  ship.move();
  for (int j = bullets.size() - 1; j >= 0; j--) {
    Bullet b = bullets.get(j);
    b.update();

    if (b.isDead()) {
      bullets.remove(j);
    }
  }

  for (int i = smallasteroids.size() - 1; i >= 0; i--) {
    SmallAsteroid s = smallasteroids.get(i);
    smallasteroids.get(i).show();
    smallasteroids.get(i).move();

    // bullet hits small asteroid
    for (int j = 0; j < bullets.size(); j++) {
      Bullet b = bullets.get(j);

      float d2 = dist((float)s.getX(), (float)s.getY(), (float)b.getX(), (float)b.getY());
      if (d2 < 20) {
        bullets.remove(j);
        smallasteroids.remove(i);
        
        smallasteroids.add(new SmallAsteroid());
        smallasteroids.get(smallasteroids.size() - 1).setSpeed(s.getXspeed() +1, s.getYspeed() +1);
        ship.setScore(ship.getScore() + 5);
        j--;
        i--;
      }
    }
    //collision small  asteroid
    float d = dist((float)s.getX(), (float)s.getY(), (float)ship.getX(), (float)ship.getY());
    if (d < 25) {
      smallasteroids.remove(i);
      ship.setHealth(ship.getHealth() - 25);
      textRed += 25;
      textGreen -= 25;
    }
    if (ship.getHealth() <= 50 || ship.getScore() > 100) {
      s.accelerate(.01);
    }
  }//end of small asteroids loop

  double tempX, tempY, tempXspeed, tempYspeed;
  for (int i = asteroids.size() - 1; i >= 0; i--) {
    Asteroid a = asteroids.get(i);
    asteroids.get(i).show();
    asteroids.get(i).move();

    for (int j = 0; j < bullets.size(); j++) {
      Bullet b = bullets.get(j);

      // bullet hits asteroid
      float d2 = dist((float)a.getX(), (float)a.getY(), (float)b.getX(), (float)b.getY());
      if (d2 < 20) {
        bullets.remove(j);
        tempX = asteroids.get(i).getX();
        tempY = asteroids.get(i).getY();
        tempXspeed =asteroids.get(i).getXspeed();
        tempYspeed = asteroids.get(i).getYspeed();
      //first small asteroid
        SmallAsteroid s1 = new SmallAsteroid();
        s1.setPosition(tempX, tempY);
        s1.setSpeed(tempXspeed, tempYspeed);
        smallasteroids.add(s1);
      //second
        SmallAsteroid s2 = new SmallAsteroid();
        s2.setPosition(tempX, tempY);
        s2.setSpeed(-tempXspeed, -tempYspeed);
        smallasteroids.add(s2);

        asteroids.remove(i);
        ship.setScore(ship.getScore() + 10);
        j--;
        i--;
      }
    }
    //collision asteroid
    float d = dist((float)a.getX(), (float)a.getY(), (float)ship.getX(), (float)ship.getY());
    if (d < 25) {
      asteroids.remove(i);
      ship.setHealth(ship.getHealth() - 25);
      textRed += 25;
      textGreen -= 25;
    }

    if (ship.getHealth() <= 50 || ship.getScore() > 100) {
      a.accelerate(.01);
    }

    if (ship.getHealth() <= 0) {
      fill(0);
      rect(0, 0, 800, 800);
      textSize(128);
      fill(240, 220, 220);
      text("GAME OVER", width/2 -400, height/2);
      textSize(24);
      text("Score: " + (int)ship.getScore(), width/2-40, height/2 + 80);
    }
  } // end of asteroids for loop
} // end of draw func


public void keyPressed() {
  if (key == 'w') {
    ship.accelerate(.2);
    shipBack.accelerate(.2);
  }
  if (key == 's')
  {
    ship.accelerate(-.05);
    shipBack.accelerate(-.05);
  }
  if (key == 'a') {
    ship.setDirection(ship.getDirection() - 10);
    shipBack.setDirection(ship.getDirection());
  }
  if (key == 'd') {
    ship.setDirection(ship.getDirection() + 10);
    shipBack.setDirection(ship.getDirection());
  }

  if (key == 'q') {
    ship.setSpeed(0, 0);
    ship.setPosition((int)(Math.random()*600)+100, (int)(Math.random()*600)+100);
    shipBack.setSpeed(0, 0);
    shipBack.setPosition(ship.getX(),ship.getY());
    ship.setDirection((int)(Math.random()*360));
    shipBack.setDirection(ship.getDirection());
  }
  if (key == 'r') {
    bullets.add(new Bullet(ship));
  }
}
