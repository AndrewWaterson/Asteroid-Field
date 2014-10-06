Asteroid[] AsteroidField;
int asteroidLimit = 15;  //number of asteroids allowed on screen 

void setup() {
  size(1000,600);

  AsteroidField = new Asteroid[asteroidLimit]; //make array of asteroid objects


  for (int i=0; i<=asteroidLimit-1; i++) {   //make the initial bunch of asteroids
    MakeAsteroid(i);
  }

}

void draw() {
  background(0);
  for (int i=0; i<=asteroidLimit-1; i++) {   //for every asteroid
    AsteroidField[i].move();   //move the asteroid
    AsteroidField[i].drawAsteroid();  //draw the asteroid
    if (AsteroidField[i].checkBorder() == true) {  //if the asteroid is off screen, replace it with a new one
      MakeAsteroid(i);
    }
  }
}

