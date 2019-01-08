class Star{
  private float xPos;
  private float yPos; 
  
  Star(float xPos, float yPos){
     this.xPos = xPos; 
     this.yPos = yPos; 
  }
  
  void show(){
    pushMatrix();
    fill(255);
    noStroke();
    ellipse(xPos, yPos, 5,5);
    popMatrix();
  }
  
  void move(){
    xPos += 0.5;
    if(xPos > width)
      xPos = 0;
  }
}
