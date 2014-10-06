class Asteroid {

  float posX ; //x coord of asteroid
  float posY ; //y coord of asteroid
  float xSpeed ; //speed of asteroid's floating through space on x axis
  float ySpeed ; //speed of y axis movement
  float deg =0; //starting position for asteroids rotation
  float spinSpeed = random(-0.1, 0.1); //speed of asteroids rotation
  float size = 30; //random radius for the asteroid

  int sides = 10;

  PVector[] Vertices = new PVector[sides]; //create array of vertices for each side (the last vertice is the first in the shape so array length is one less than the n of sides)

  float[] vertx = new float[30];  //array of x coords for asteroid vertices
  float[] verty = new float[30];  //array of y coords for asteroid vertices

  Asteroid(float xCoordinate, float yCoordinate, float xVelocity, float yVelocity) {

    posX = xCoordinate;
    posY = yCoordinate;
    xSpeed = xVelocity;
    ySpeed = yVelocity;



  translate(width/2, height/2); //translate grid to center of screen

  //fill vertices array with coordinates
  for (int i=0; i<sides; i++) { 
    float x = random(-5,5) + (size*cos((TWO_PI/sides)*(i+1)));
    float y = random(-5,5) + (size*sin((TWO_PI/sides)*(i+1)));
    Vertices[i] = new PVector(x, y);
  }
  }

  void move() {
    posX = posX + xSpeed;
    posY = posY + ySpeed;
    deg+=spinSpeed;
  }

  void drawAsteroid() {
    //colours and line formatting etc
    noSmooth(); //for that authentic asteroids look 
    ellipseMode(CORNER);
    fill(0);
    stroke(255);
    strokeWeight(1);

    //rotating and drawing the asteroid
    pushMatrix();
    translate(posX, posY);
    rotate(deg); //deg is incremented in Asteroid.move, this way the asteroid won't spin if it is stationary for some reason

  beginShape();
  for (int i=0; i<sides; i++) {
    vertex(Vertices[i].x,Vertices[i].y);
  }
  vertex(Vertices[0].x,Vertices[0].y);
  endShape();
  
    popMatrix();
  }

  boolean checkBorder() {
    if (((posX>width+size)||(posX<0-size))||((posY>height+size)||(posY<0-size))) {
      return true;
    } else return false;
  }
}  

