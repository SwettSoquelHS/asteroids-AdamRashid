class Shoot extends Ship {
  private float xPos, yPos;
  private float direction;
  private int index;
  private boolean BULLET_LIFE = true;
  Shoot(float x_Pos, float y_Pos, float direction, int index) {
    super(x_Pos, y_Pos);
    xPos = x_Pos;
    yPos = y_Pos;
    this.direction = direction;
  }

  void show() {
    if (SHIP_LIFE > 0 && BULLET_LIFE) {
      fill(#FAFF00);
      ellipse(xPos, yPos, 5, 5);
    }
  }

  void move() {
    if (BULLET_LIFE) {
      xPos = xPos + 12 * (float)Math.cos(radians(direction));
      yPos = yPos + 12 * (float)Math.sin(radians(direction));
    }
  }

  float getXpos() {
    return xPos;
  }

  float getYpos() {
    return yPos;
  }
  
  void setLife(boolean t){
    BULLET_LIFE = t;
  }
}
