//Shaikat Islam
//APCS pd2
//HW40 -- All That Bouncin'
//2017-05-14

//Ball

class Ball {
  
//instance vars; dx and dy are velocity, x and y are position
  float dx, dy, x, y, size;
  int state;
  color col; 
  
  /*
 states:
   0 - dead
   1 - moving
   2 -  expanding
   3 - shrinking
   */  
   
  //set and get
  public void setState(int s) { 
    state = s;
  }
  
  public int getState() { 
    return state;
  } 
  
//default
  Ball() {
    //velocity of balls
    dx = random(7); 
    dy = random(7); 
    //state
    state = 1;
    x = random(width); //0, 600
    y = random(height);
    size = 25;
    col = color(int(random(255)), int(random(255)), int(random(255)));
  }

//overloaded
  Ball(float xcoor, float ycoor, int _state) {
    this();
    x = xcoor;
    y = ycoor;
    state = _state;
  } 
  
//bounce() - bouncing by negating dx and dy for velocity
  void bounce() {
    if (x <= 0 || x >= 600) {
      dx = -(dx); //negate x vel
    }
    if (y <= 0 || y >= 600) {
      dy = -(dy); //negate y vel
    }
  }// end bounce()

//move() - moves ball with respect to dx and dy
  void move() { 
    x += dx;
    y += dy;
  }// end move()
  
//getSwole() - changes size based on state
   void getSwole() {
     if (state == 2){ //expand
       if (size >= 100){ //shrink at size 100
         state = 3;
       }
       else{ 
         size++;
       }
     }
     else { //shrink
       if (size <= 0){
         state = 0;
       }
       else{
         size--;
       }
     }
   }// end getSwole()

//hitball - did it hit the ball
  boolean hitball(Ball collider) {
    if ( (size + collider.size)/2 > distance(this, collider) ) { 
      return true;
    }
    return false;
  }// end hitball()

//distance btwn balls
  float distance(Ball collider1, Ball collider2) {
    return sqrt( sq(collider1.x - collider2.x) +  
      sq(collider1.y - collider2.y) ); //distance formula
  }//end distance()

//print image
  void update() {    
    //if its not dead make it move or expand
    if (state != 0){
      //if its moving make it bounce and move normally
      if (state == 1){ 
        bounce();
        move();
      }
      //if its state 2 or 3, make it expand (upon two balls hitting, and the function hitball() resolving to true
      else{ 
        getSwole(); 
      }
      //aesthetic purposes
      fill(col); //fill with color
      noStroke(); //no outline
      ellipse (x, y, size, size); //make circle

    }
  }//end update

}//end class
