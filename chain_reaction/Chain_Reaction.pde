//Shaikat Islam
//APCS pd2
//HW40 -- All That Bouncin'
//2017-05-14

//Chain Reaction

//instance vars
Ball[] balls;
boolean reactionstate = false;

//setup
void setup() {
  //size of canvas
  size(600,600);
  background(0);
  //how many balls
  balls = new Ball[30];
  //set ball position and state
  for (int i = 0 ; i < balls.length ; i++){
    balls[i] = new Ball(random(360), 2 + random(2), 1);
  }
  frameRate(60);
}//end setup()

//draw
void draw() {
  clear();
  for (Ball b : balls) {
    b.update(); //actively change screen image
    for (Ball collider : balls) {
      if (b != collider && b.state == 1 && collider.state > 1 && b.hitball(collider)) { //detect all balls other than self
        b.setState(2); //expand it
      }
    } 
  }
}//end draw()

//mousePressed
void mousePressed(){
  if (!reactionstate){
    balls[0] =  new Ball(mouseX, mouseY, 2) ; //coord of mouse pointer
    reactionstate = true;
  }
}//end mousePressed()