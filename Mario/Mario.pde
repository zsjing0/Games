PImage mario;
PImage mushroom;
PImage back_ground;

//starting position of mushroom.
float mushX = 350;
float mushY =350;

boolean mushMove = true;
float Xdir = 0;
float Ydir = 0;

//starting position of mario
float marioX = 550;
float marioY = 350;

float marioW = 40;
float marioH = 40;
int increment = 10;

void setup(){
  size (700,700);
  mario = loadImage("mario.png");
  mushroom = loadImage("mushroom.png");
  back_ground = loadImage("background.jpg");
  back_ground.resize(700,700);
}

void draw(){
  image(back_ground,0,0);
  text("Direction: Use arrow key to move around",0,10);
  
  //this is how me move Mario.
  if(keyPressed == true && key == CODED && keyCode == LEFT)
  {
    marioX -= 8;
  }
  
  if(keyPressed == true && key == CODED && keyCode == RIGHT)
  {
    marioX += 8;
  }
  
  if(keyPressed == true && key == CODED && keyCode == UP)
  {
    marioY -= 8;
  }
  
  if(keyPressed == true && key == CODED && keyCode == DOWN)
  {
    marioY += 8;
  }
  
  if(marioX < mushX + marioW/2 && marioX > mushX - marioW/2 && marioY < mushY + marioH/2 && marioY > mushY - marioH/2)
  {
    mushX = random(50,650);
    mushY = random(50,650);
    Xdir = random(-3,3);
    Ydir = random(-3,3);
    marioW += increment; //when Mario eat the mushroom, its width and height will increase.
    marioH += increment;
  }
  
  if (mushMove == true)
  {
    mushX += Xdir;
    mushY += Ydir;
  }
  
  //if the mushroom went out of bounce, a new mushroom will generate at a random place.
  if(mushX < 10 || mushX > 690 || mushY < 10 || mushY > 690)
  {
    mushX = random(50,650); 
    mushY = random(50.650);
    Xdir = random(1,3);
    Ydir = random(1,3);
  }
  
  image(mushroom, mushX, mushY, 35, 30);//mushroom
  
  image (mario, marioX, marioY, marioW, marioH);//Mario
}
