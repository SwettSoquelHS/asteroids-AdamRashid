class Ship extends Mover {
  protected float xPos, yPos;
  protected float speed, direction;
  protected int SHIP_LIFE;
  protected int INDEX_OF_SHOT = 0;
  protected int ammo = 50;
  protected int fireSpeed = 150; //Amount of delay between each bullet in milliseconds
  protected int shotTime;
  protected Shoot[] shot;
  Ship(float xPos, float yPos) {
    super(xPos, yPos);
    this.xPos = xPos;
    this.yPos = yPos;
    SHIP_LIFE = 1;
    speed = 0;
    direction = 45;
    shot = new Shoot[50];
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
    
    //This show the bullet on the screen and moves it
    for (int i = 0; i < INDEX_OF_SHOT; i++) {
      shot[i].move();
      shot[i].show();
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

  void fireBullet() {
    //This defines the bullet in the array as well as limit the firerate of the ship
    if (INDEX_OF_SHOT < shot.length) {
      fireRate();
    }
  }
  
  void reload(){
    ammo = shot.length;
    INDEX_OF_SHOT = 0;
  }
  
  void checkCollision(){
    //This checks for collision between the bullet and the asteroids
    for (int i = 0; i < INDEX_OF_SHOT; i++) {
      for (int j = 0; j < NUM_OF_ASTEROIDS; j++) {
        spacefield[j].crack(shot[i].getXpos(), shot[i].getYpos());
      }
    }
  }
  
  void fireRate() {
  int passedTime = millis() - shotTime;
  if (passedTime > fireSpeed) {
    shot[INDEX_OF_SHOT] = new Shoot(xPos, yPos, direction, INDEX_OF_SHOT); 
    INDEX_OF_SHOT++;
    ammo--;
    println("pew");
    shotTime = millis();
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
  
  int getAmmo(){
    return ammo;
  }
}
