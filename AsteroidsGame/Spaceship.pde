class Ship extends Mover {
  protected float xPos, yPos;
  protected float speed, direction;
  protected int SHIP_LIFE;
  Ship(float xPos, float yPos) {
    super(xPos, yPos);
    this.xPos = xPos;
    this.yPos = yPos;
    SHIP_LIFE = 1;
    speed = 0;
    direction = 45;
  }

  void show() {
    if (SHIP_LIFE > 0) {
      pushMatrix();
      fill(#3FFAD9);
      stroke(0);
      translate(xPos, yPos);
      rotate(radians(direction));
      triangle(-10, -10, -10, 10, 20, 0);
      triangle(6, 4, -10, 4, -10, 15);
      triangle(6, -4, -10, -4, -10, -15);
      triangle(-4, 0, -20, 14, -20, -14);
      stroke(#3FFAD9);
      line(-6, 11, 4, 11);
      line(-6, 10, 4, 10);
      line(6, 10, 4, 11);
      line(-6, -11, 4, -11);
      line(-6, -10, 4, -10);
      line(6, -10, 4, -11);
      popMatrix();
    }
  }

  void move() {
    xPos = xPos + speed * (float)Math.cos(radians(direction));
    yPos = yPos + speed * (float)Math.sin(radians(direction));

    if (xPos > width + 20)
      xPos = -20;
    if (xPos < -20)
      xPos = width + 20;
    if (yPos > height + 20)
      yPos = -20;
    if (yPos < -20)
      yPos = height + 20;
  }

  void destroyShip(float x, float y) {
    if (SHIP_LIFE > 0) {
      if (dist(x, y, xPos, yPos) < 40) {
        pushMatrix();
        stroke(0);
        fill(#FC4800);
        translate(xPos, yPos);
        ellipse(0, 0, 50, 50);
        popMatrix();
        SHIP_LIFE--;
      }
    }
  }

  float getXpos() {
    return xPos;
  }

  float getYpos() {
    return yPos;
  }

  float getSpeed() {
    return speed;
  }

  float getShipLife() {
    return SHIP_LIFE;
  }

  float getDir() {
    return direction;
  }

  void setDir(float dir) {
    direction = dir;
  }

  void setSpeed(float s) {
    speed = s;
  }

  float getRadius() {
    return 0;
  }
}
