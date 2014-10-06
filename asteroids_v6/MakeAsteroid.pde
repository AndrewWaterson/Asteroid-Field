void MakeAsteroid(int asteroidNumber) { 
  
  //This function generates a random position and velocity and then creates an Asteroid object with these parameters.
  
//set asteroid inital position and veloctiy
  float n = (random(width*2+height*2)); //random point along perimeter of screen

  float newX = 0 ; 
  float newY = 0 ;
  float newXSpeed = 0;
  float newYSpeed = 0;

  if (n <= width) {  //top edge of window
    newX = n;
    newY = 0;
    newXSpeed= random(-2, 2);
    newYSpeed= random(0, 2);
  }
  if ((n > width) && (n <= width+height)) { //right side of window
    newX=width;
    newY=n - width;
    newXSpeed= random(-2, 0);
    newYSpeed= random(-2, 2);
  }
  if ((n > width+height) && ( n <=width*2+height)) { //bottom of window
    newX = width - (n-(height+width));
    newY = height;
    newXSpeed= random(-2, 2);
    newYSpeed= random(-2, 0);
  }
  if (n>width*2+height) {  // left side of window
    newX = 0;
    newY = height - (n-(width*2+height));
    newXSpeed= random(0, 2);
    newYSpeed= random(-2, 2);
  }
  


  AsteroidField[asteroidNumber] = new Asteroid(newX, newY, newXSpeed, newYSpeed);
}

