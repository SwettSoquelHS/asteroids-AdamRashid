class Asteroids extends Mover {
  protected float xPos, yPos;
  protected float xPos2, yPos2;
  protected float xPos3, yPos3;
  protected float speedOfA, dir;
  protected float dir2, dir3;
  protected int index;
  protected float tilt;
  protected boolean HIT;
  protected boolean HIT2;
  protected boolean HIT3;
  private int numOfAsteroids;
  protected float X1, Y1;
  protected float X2, Y2;
  protected float X3, Y3;
  protected float X4, Y4;
  protected float X5, Y5;

  Asteroids(float xPos, float yPos, int index) {
    super(xPos, yPos);
    this.xPos = xPos;
    this.yPos = yPos;
    xPos2 = -50;
    yPos2 = -50;
    xPos3 = -50;
    yPos3 = -50;
    speedOfA= random(0.2, 1.5);
    numOfAsteroids = 1;
    if (yPos == height + 20) {
      dir = random(200, 320);
    } else {
      dir = random(30, 140);
    }

    if (random(1) >= 0.8) {
      numOfAsteroids = 2;
    }
    HIT = false;
    HIT2 = false;
    HIT3 = false;

    X1 = random(-5, 20);
    Y1 = random(20, 40);

    X2 = random(20, 40);
    Y2 = random(-10, 10);

    X3 = random(-10, 10);
    Y3 = random(-30, -20);

    X4 = random(-20, -10);
    Y4 = random(-20, -10);

    X5 = random(-25, -20);
    Y5 = random(10, 20);
  }

  void show() {
    if (numOfAsteroids == 1) {
      pushMatrix();
      stroke(255);
      fill(200);
      translate(xPos, yPos);
      rotate(radians(tilt));
      line(X1, Y1, X2, Y2);
      line(X2, Y2, X3, Y3);
      line(X3, Y3, X4, Y4);
      line(X4, Y4, X5, Y5);
      line(X5, Y5, X1, Y1);
      popMatrix();
    } else if (numOfAsteroids == 2) {
      pushMatrix();
      stroke(255);
      fill(200);
      translate(xPos2, yPos2);
      rotate(radians(tilt));
      scale(1.8);
      line(-10, 0, -7, 10);
      line(-7, 10, 0, 5);
      line(0, 5, 7, 6);
      line(7, 6, 4, -5);
      line (4, -5, 0, 0);
      line(0, 0, -3, -6);
      line(-3, -6, -10, 0);
      popMatrix();

      pushMatrix();
      stroke(255);
      fill(200);
      translate(xPos3, yPos3);
      rotate(radians(tilt));
      scale(1.8);
      line(-10, 0, -7, 10);
      line(-7, 10, 0, 5);
      line(0, 5, 7, 6);
      line(7, 6, 4, -5);
      line (4, -5, 0, 0);
      line(0, 0, -3, -6);
      line(-3, -6, -10, 0);
      popMatrix();
    } else if (numOfAsteroids == 3) {
      pushMatrix();
      stroke(255);
      fill(200);
      translate(xPos2, yPos2);
      rotate(radians(tilt));
      scale(1.8);
      line(-10, 0, -7, 10);
      line(-7, 10, 0, 5);
      line(0, 5, 7, 6);
      line(7, 6, 4, -5);
      line (4, -5, 0, 0);
      line(0, 0, -3, -6);
      line(-3, -6, -10, 0);
      popMatrix();
    } else if (numOfAsteroids == 4) {
      pushMatrix();
      stroke(255);
      fill(200);
      translate(xPos3, yPos3);
      rotate(radians(tilt));
      scale(1.8);
      line(-10, 0, -7, 10);
      line(-7, 10, 0, 5);
      line(0, 5, 7, 6);
      line(7, 6, 4, -5);
      line (4, -5, 0, 0);
      line(0, 0, -3, -6);
      line(-3, -6, -10, 0);
      popMatrix();
    }
  }

  void move() {
    if (numOfAsteroids == 1) {
      if (xPos > width + 20)
        xPos = -20;
      if (xPos < -20)
        xPos = width + 20;
      if (yPos > height + 20)
        yPos = -20;
      if (yPos < -20)
        yPos = height + 20;
      xPos = xPos + speedOfA * (float)Math.cos(radians(dir));
      yPos = yPos + speedOfA * (float)Math.sin(radians(dir));
    } else if (numOfAsteroids == 2) {
      if (xPos2 > width + 20)
        xPos2 = -20;
      if (xPos2 < -20)
        xPos2 = width + 20;
      if (yPos2 > height + 20)
        yPos2 = -20;
      if (yPos2 < -20)
        yPos2 = height + 20;

      if (xPos3 > width + 20)
        xPos3 = -20;
      if (xPos3 < -20)
        xPos3 = width + 20;
      if (yPos3 > height + 20)
        yPos3 = -20;
      if (yPos3 < -20)
        yPos3 = height + 20;
      xPos2 = xPos2 + speedOfA * (float)Math.cos(radians(dir));
      yPos2 = yPos2 + speedOfA * (float)Math.sin(radians(dir));
      xPos3 = xPos3 + speedOfA * (float)Math.cos(radians(-1 * dir));
      yPos3 = yPos3 + speedOfA * (float)Math.sin(radians(-1 * dir));
    } else if (numOfAsteroids == 3) {
      if (xPos2 > width + 20)
        xPos2 = -20;
      if (xPos2 < -20)
        xPos2 = width + 20;
      if (yPos2 > height + 20)
        yPos2 = -20;
      if (yPos2 < -20)
        yPos2 = height + 20;

      xPos2 = xPos2 + speedOfA * (float)Math.cos(radians(dir));
      yPos2 = yPos2 + speedOfA * (float)Math.sin(radians(dir));
    } else if ( numOfAsteroids == 4) {
      if (xPos3 > width + 20)
        xPos3 = -20;
      if (xPos3 < -20)
        xPos3 = width + 20;
      if (yPos3 > height + 20)
        yPos3 = -20;
      if (yPos3 < -20)
        yPos3 = height + 20;

      xPos3 = xPos3 + speedOfA * (float)Math.cos(radians(-1 * dir));
      yPos3 = yPos3 + speedOfA * (float)Math.sin(radians(-1 * dir));
    }
    tilt += 2;
  }

  void crack(float x, float y) {
    if (numOfAsteroids == 1) {
      if (dist(x, y, xPos, yPos) < 25) {
        HIT = true;
        numOfAsteroids++;
        xPos2 = xPos + 15;
        yPos2 = yPos - 15;
        xPos3 = xPos -15;
        yPos3 = yPos + 15;
        xPos = -50;
        yPos = -50;
      }
    } else if (numOfAsteroids == 2 || numOfAsteroids == 3|| numOfAsteroids == 4) {
      if (dist(x, y, xPos2, yPos2) < 15) {
        HIT2 = true;
        xPos2 = -50;
        yPos2 = -50;
        if (numOfAsteroids == 3) {
          numOfAsteroids = 5;
        } else {
          numOfAsteroids = 4;
        }
      } else if (dist(x, y, xPos3, yPos3) < 15) {
        HIT3 = true;
        xPos3 = -50;
        yPos3 = -50;
        if (numOfAsteroids == 4) {
          numOfAsteroids = 5;
        } else {
          numOfAsteroids = 3;
        }
      }
    }
  }

  float getXpos() {
    return xPos;
  }

  float getYpos() {
    return yPos;
  }

  float getXpos2() {
    return xPos2;
  }

  float getYpos2() {
    return yPos2;
  }

  float getXpos3() {
    return xPos3;
  }

  float getYpos3() {
    return yPos3;
  }

  boolean getHit() {
    return HIT;
  }

  boolean getHit2() {
    return HIT2;
  }

  boolean getHit3() {
    return HIT3;
  }

  float getRadius() {
    return 0;
  }

  float getDir() {
    return dir;
  }

  void setDir(float dir) {
    direction = dir;
  }

  void setSpeed(float s) {
    speed = s;
  }

  float getSpeed() {
    return speed;
  }

  void setHit(boolean t) {
    HIT = t;
  }

  void setHit2(boolean t) {
    HIT2 = t;
  }

  void setHit3(boolean t) {
    HIT3 = t;
  }
}
