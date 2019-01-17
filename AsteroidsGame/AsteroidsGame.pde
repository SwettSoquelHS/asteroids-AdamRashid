float x_pos, y_pos; //<>//
int NUM_OF_ASTEROIDS = 0;
int savedTime;
int superTime;
int superLength = 2000;
int totalTime = 5000;
int score = 0;
int gameScreen = 1;
int superMeter = 0;
Asteroids[] spacefield;
Star[] stars;
Ship spaceship;
float[][] fire = new float [100000][15];
float currentflamef, nextflamef;
int currentflame=0, nextflame;
boolean ROTATE_LEFT = false;
boolean ROTATE_RIGHT = false;
boolean MOVE_FORWARD = false;
boolean LIGHT_FIRE = false;
boolean SHOOTING_BULLET = false;

void setup() {
  size(700, 500);
  savedTime = millis();
  x_pos = width/2.0;
  y_pos = height/2.0;
  spacefield = new Asteroids[500];
  stars = new Star[200];
  smooth();
  noStroke();
  spaceship = new Ship(x_pos, y_pos);

  for (int i = 0; i < stars.length - 1; i++) {
    int x_Pos = (int)random(0, 700);
    int y_Pos = (int)random(0, 600);
    stars[i] = new Star(x_Pos, y_Pos);
  }

  for (NUM_OF_ASTEROIDS = 0; NUM_OF_ASTEROIDS < 5; NUM_OF_ASTEROIDS++) {
    float x = random(0, width);
    float y;
    double checker = Math.random();
    if (checker >= 0.5) {
      y = height + 20;
    } else {
      y = -20;
    }
    spacefield[NUM_OF_ASTEROIDS] = new Asteroids(x, y, NUM_OF_ASTEROIDS);
  }
}

void draw() {
  if (gameScreen == 1) {
    game();
  } else if (gameScreen == 2) {
    gameOver();
  }
}

void game() {
  fill(0, 80);
  rect(0, 0, width, height);
  fill(255);
  textSize(12);
  text(spaceship.getAmmo(), width - 40, height - 10);
  text("Score: " + score, width - 70, 20);

  if (spaceship.getAmmo() == 0)
    text("Reload", width - 40, height - 20);

  for (int i = 0; i < stars.length- 1; i++) {
    stars[i].move();
  }
  for (int i = 0; i < stars.length- 1; i++) {
    stars[i].show();
  }

  ultimate();
  spaceship.move();
  spaceship.show();
  spaceship.checkCollision();
  createAsteroids();
  for (int i = 0; i < NUM_OF_ASTEROIDS; i++) {
    spacefield[i].move();
  }

  for (int i = 0; i < NUM_OF_ASTEROIDS; i++) {
    spacefield[i].show();
  }
 
  //This fires the bullet
  if (SHOOTING_BULLET) {
    spaceship.fireBullet();
  }
  
  //This will auto fire the bullet if super is activated
  if(spaceship.getSuperMode()){
    spaceship.fireBullet();
    if(spaceship.getAmmo() == 0){
      spaceship.setSuperMode(false);
      spaceship.setAmmo(50);
      spaceship.setIndex(0);
    }
  }

  //Update x,y position
  if (ROTATE_LEFT) 
    spaceship.setDir(spaceship.getDir() - 10.0);
  if (ROTATE_RIGHT)
    spaceship.setDir(spaceship.getDir() + 10.0);
  if (MOVE_FORWARD == true) {
    if (spaceship.getSpeed() < 8) {
      spaceship.setSpeed(spaceship.getSpeed() + 0.1);
    }
  } else {
    if (spaceship.getSpeed() > 0) {
      spaceship.setSpeed(spaceship.getSpeed() - 0.15);
    }
    if (spaceship.getSpeed() < 0) {
      spaceship.setSpeed(0);
    }
  }



  for (int i = 0; i < NUM_OF_ASTEROIDS; i++) {
    spaceship.destroyShip(spacefield[i].getXpos(), spacefield[i].getYpos());
    spaceship.destroyShip(spacefield[i].getXpos2(), spacefield[i].getYpos2());
    spaceship.destroyShip(spacefield[i].getXpos3(), spacefield[i].getYpos3());
  }

  if (LIGHT_FIRE && spaceship.getShipLife() > 0) {
    create_fire();
  }

  for (int i = 0; i < NUM_OF_ASTEROIDS; i++) {
    if (spacefield[i].getHit()) {
      score += 100;
      spacefield[i].setHit(false);
    }

    if (spacefield[i].getHit2()) {
      score += 50;
      spacefield[i].setHit2(false);
    }

    if (spacefield[i].getHit3()) {
      score += 50;
      spacefield[i].setHit3(false);
    }
  }

  update_fire(); 
  draw_fire();

  if (spaceship.getShipLife() == 0) {
    gameScreen = 2;
  }
}

void gameOver() {
  fill(255);
  textSize(30);
  textAlign(CENTER);
  text("Game Over!", width/2, height/2);
}

void mousePressed() {
  if (gameScreen == 2) {
    reset();
  }
}
void keyPressed() {
  if (keyCode == LEFT || key == 'a' || key == 'A') {
    ROTATE_LEFT = true;
  } else if (keyCode == RIGHT|| key == 'd' || key == 'D') {
    ROTATE_RIGHT = true;
  } else if (keyCode == UP || key == 'w' || key == 'W') {
    MOVE_FORWARD = true;
    LIGHT_FIRE = true;
  }

  if (key == ' ') {
    if (spaceship.getAmmo() > 0) {
      SHOOTING_BULLET = true;
    }
  }
}

void keyReleased() {
  if (keyCode == LEFT || key == 'a' || key == 'A') {
    ROTATE_LEFT = false;
  } else if (keyCode == RIGHT || key == 'd' || key == 'D') {
    ROTATE_RIGHT = false;
  } else if (keyCode == UP || key == 'w' || key == 'W') {
    MOVE_FORWARD = false;
    LIGHT_FIRE = false;
  }

  if ((key == 'r' || key == 'R') && !spaceship.getSuperMode()) {
    spaceship.reload();
  }

  if (key == ' ') {
    SHOOTING_BULLET = false;
  }
}

void ultimate() {
  superMeter = score;

  if (superMeter >= 1000) {
    superMeter = 1000;
  }

  if (key == 't' && superMeter >= 1000) {
    spaceship.setAmmo(500);
    spaceship.setIndex(0);
    spaceship.setSuperMode(true);
  }
  pushMatrix();
  stroke(0);
  fill(255);
  rect(width/2 - 250, height - 30, 500, 20);
  popMatrix();

  pushMatrix();
  stroke(0);
  fill(#03FF22);
  rect(width/2 - 250, height - 30, superMeter/2, 20);
  popMatrix();
}

void reset() {
  score = 0;
  savedTime = millis();
  x_pos = width/2.0;
  y_pos = height/2.0;
  NUM_OF_ASTEROIDS = 0;
  ROTATE_LEFT = false;
  ROTATE_RIGHT = false;
  MOVE_FORWARD = false;
  LIGHT_FIRE = false;
  SHOOTING_BULLET = false;
  spaceship = new Ship(x_pos, y_pos);

  for (int i = 0; i < stars.length - 1; i++) {
    int x_Pos = (int)random(0, 700);
    int y_Pos = (int)random(0, 600);
    stars[i] = new Star(x_Pos, y_Pos);
  }

  for (NUM_OF_ASTEROIDS = 0; NUM_OF_ASTEROIDS < 5; NUM_OF_ASTEROIDS++) {
    float x = random(0, width);
    float y;
    double checker = Math.random();
    if (checker >= 0.5) {
      y = height + 20;
    } else {
      y = -20;
    }
    spacefield[NUM_OF_ASTEROIDS] = new Asteroids(x, y, NUM_OF_ASTEROIDS);
  }
  gameScreen = 1;
}

void update_fire() {
  for (int flame=0; flame<100000; flame++) {
    if (fire[flame][0]==1) {

      if (get(int(fire[flame][1]), int(fire[flame][2]))>200) {
        fire[flame][0]=0;
      }
      fire[flame][1]=fire[flame][1]+fire[flame][5]*cos(fire[flame][3]);
      fire[flame][2]=fire[flame][2]+fire[flame][5]*sin(fire[flame][3]);
    }
    fire[flame][7]+=1;
    if (fire[flame][7]>fire[flame][6]) {
      fire[flame][0]=0;
    }
  }
}
void draw_fire() {
  for (int flame=0; flame<currentflame; flame++) {
    if (fire[flame][0]==1) {
      fill(fire[flame][9], fire[flame][10], 0, 40);
      pushMatrix();
      noStroke();
      translate(fire[flame][1], fire[flame][2]);
      rotate(fire[flame][8]);
      rect(0, 0, fire[flame][4], fire[flame][4]);
      popMatrix();
    }
  }
}
void create_fire() {
  nextflame=currentflame+10;
  for (int flame=currentflame; flame<nextflame; flame++) {
    fire[flame][0]=1;
    fire[flame][1]= spaceship.getXpos();
    fire[flame][2]= spaceship.getYpos();
    fire[flame][3]=PI + radians(spaceship.getDir());//angle
    fire[flame][4]=random(5, 10);//size
    fire[flame][5]=random(.5, 2);//speed
    fire[flame][6]=random(5, 20)/fire[flame][5];//maxlife
    fire[flame][7]=0;//currentlife
    fire[flame][8]=random(0, TWO_PI);
    fire[flame][9]=random(200, 255);//red
    fire[flame][10]=random(0, 150);//green
  }
  currentflame=nextflame;
}


void createAsteroids() {
  int passedTime = millis() - savedTime;
  if (passedTime > totalTime) {
    for (int i = 0; i < 5; i++) {
      float x = random(0, width);
      float y;
      double checker = Math.random();
      if (checker >= 0.5) {
        y = height + 20;
      } else {
        y = -20;
      }
      spacefield[NUM_OF_ASTEROIDS++] = new Asteroids(x, y, NUM_OF_ASTEROIDS);
    }
    println("Five Seconds");
    println("Num of asteroids " + NUM_OF_ASTEROIDS);
    savedTime = millis();
  }
}
