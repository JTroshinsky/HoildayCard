int skierX=525;
int skierY=675;
int liftY=185;
int control=1;
int direction=0;
int sunX=50;
int snow=0;
PImage img0;
PImage img1;
PImage img2;
PImage lift;
PImage tree;
PImage house;
PImage eLift;
boolean left;
boolean right;
boolean drop;

void setup()
{
  size(600,700);
  noStroke();
  
//Images-------------------------------------------------
  img0=loadImage("http://i.imgur.com/2Yo3nds.jpg");
  img1=loadImage("http://i.imgur.com/9Ap4ssu.jpg");
  img2=loadImage("http://i.imgur.com/QoYodMj.jpg");
  lift=loadImage("http://i.imgur.com/QgFJRfy.png");
  tree=loadImage("http://i.imgur.com/ACdd5lE.png");
  house=loadImage("http://i.imgur.com/kMdWz1N.png");
  eLift=loadImage("http://i.imgur.com/13JG4YM.png");


  //img0=loadImage("skier0.jpg");
  //img1=loadImage("skier1.jpg");
  //img2=loadImage("skier2.jpg");
  //lift=loadImage("lift.png");
  //tree=loadImage("tree.png");
  //house=loadImage("chalet.png");
  //eLift=loadImage("eLift.png");
  
  frameRate(60);
  
  background(0,0,250);
  fill(#FFFFFF);
  rect(0,150,600,550);
  textSize(20);
  text("[A] goes left, [D] goes right, [E] makes skier go down hill",25,775);
}

void draw()
{  
//Skier goes down hill----------------------------------
  if(control==0)
  {
    if(left==true)
    {
      if(skierX>0)
      {
        skierX--;      
      }
      skierY++;
      image(img0,skierX,skierY);      
    }
    else if(right==true)
    {
      if(skierX<580)
      {
        skierX++;      
      }
      skierY++;
      image(img1,skierX,skierY);
    }
    else
    {
      skierY++;  
      image(img2,skierX,skierY);
    }
        
    if(skierY>675)
    {
      control=1;      
    }   
    
    if(liftY<675)
    {
    liftY++;
    image(eLift,20,liftY-6);
    }
    stuff();
  }   
 
//Moves to ski lift---------------------------------------
  if(control==1)
  {
    if(skierX>20)
    {
      skierX--;
      noStroke();
      fill(#FFFFFF);
      rect(skierX+5,skierY,20,20);
      image(img0,skierX,skierY); 
    }
    else
    {
      control=2;
    }
    stuff();
  }
  
//Ski lift------------------------------------------------
  if(control==2)
  {
     if(skierY>190)
     {
       skierY--;       
     }
     else
     {
       liftY=185;
       control=3;
     }
     image(lift,skierX,skierY-5);
     stroke(#FFFFFF);
     fill(#FFFFFF);
     rect(skierX,skierY+16,35,8);
     stuff();
  }
  
//Left right at top of hill-------------------------------
  if(control==3)
  {    
    if(left==true)
    {
      if(skierX>0)
      {
        skierX--;      
      }            
    }
    else if(right==true)
    {
      if(skierX<580)
      {
        skierX++;      
      }
    }
    if(drop==true)
    {
      control=0;
    }    
    image(img2,skierX,skierY);    
    stroke(#FFFFFF);
    fill(#FFFFFF);
    rect(skierX-20,skierY,20,20);
    rect(skierX+20,skierY,20,20);
     if(liftY<675)
    {
    liftY++;
    image(eLift,20,liftY-6);
    }
    stuff();
  }
}

//Key readers----------------------------------------------
void keyPressed()
{
  if(key=='a') left=true;
  if(key=='d') right=true;
  if(key=='e') drop=true;
}

void keyReleased()
{
  if(key=='a') left=false;
  if(key=='d') right=false;
  if(key=='e') drop=false;
}

void stuff()
{
//Snow stuff------------------------------------------------
  snow++;
  if(snow%4==0)
  {
    fill(0,0,250);
    rect(0,0,600,150);
    for(int x=1;x<100;x++)
    {
      rect(random(1,600),random(1,148),2,2);    
    }
   }
  textSize(30);
  fill(204, 61, 101);
  text("Merry Christmas", 200,100);

  //Sun movement----------------------------------------------
  sunX++;
  if(sunX>650)
  {
    sunX=-50;
  }
  stroke(0,0,250);
  fill(#FFE079);
  ellipse(sunX,40,40,40); 
  
  //Extra images---------------------------------------------
  fill(#030303);
  rect(35,175,4,500);  
  image(house,480,600);
  
  image(tree,80,240);
  image(tree,80,540);
  image(tree,120,350);
  image(tree,200,450);
  image(tree,250,200);
  image(tree,290,520);
  image(tree,320,300); 
  image(tree,380,430);
  image(tree,450,225);
  image(tree,510,420);
  image(tree,560,300);  
}
    


