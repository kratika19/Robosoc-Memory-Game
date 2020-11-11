Car[] card = new Car[16];
int[] x = new int[16];
int[] y = new int[16];
int[] fv = new int[16];
int[] checkFv = new int[2];
int[] cardUp = new int[2];
boolean[] clicked = new boolean[16];
PImage flip;
PFont myFont;
int flipped =0;
int win =0;
PImage intro;
int flag =0;
void setup()
{
  intro = loadImage("intro.PNG");
  int myX = 25;
  int myY = 75;
  int count =1;
  size(500,600);
  myFont = createFont("Verdana" , 40, true);
  flip = loadImage("flip.PNG");
  
  //filling araays
  for(int i=0;i<16;i++)
  {
    clicked[i] = false;
    y[i] = myY;
    x[i] = myX;
    fv[i] = count;
    count+=1;
    if(count==9)
    {
      count =1;
    }
    
    if(myX<345)
    myX += 115;
    
    else if(myX>345)
    {
      myX =25;
      myY += 115;
    }
  }
  
  shuffle();
  
    for(int j=0;j<16;j++)
    card[j] = new Car(x[j], y[j], fv[j]);
  }
  
void draw()
  {
    textFont(myFont);
    fill(0);
    background(125,45,55);
    image(intro,25,10);
    for(int i=0;i<16;i++)
    card[i].display();
    
    image(flip,195,540);
    
    if(mousePressed )
      if(mouseX > 195 && mouseX < 295 &&mouseY > 540 &&mouseY < 600)
       { 
         for(int i =0;i<16;i++)
         {
           card[i].faceDown();
           clicked[i] = false;
           flipped =0;
         }
       }
    if(win ==8)
    {
      text("YOU WIN!!",150,300);
      textSize(15);
    }
  }
void mouseClicked()
{
  for(int i=0;i<16;i++)
    {
      if(mouseX > x[i] && mouseX < (x[i]+105) &&mouseY > y[i] &&mouseY < (y[i]+105) && (clicked[i]==false))
      {
        card[i].displayFront();
        clicked[i] = true;
        cardUp[flipped] = i;
        int see=0;
        flipped++;
        flag++; 
        if(flipped == 2)
        {
          flipped =0;
          
          if(fv[cardUp[0]] == fv[cardUp[1]])
          {
            card[cardUp[0]].matched();
            card[cardUp[1]].matched();
            win++;
            see =1;
          }
          
        }
        if(flag==3 && see!=1)
          {
             for(int j =0;j<16;j++)
         {
           card[j].faceDown();
           clicked[j] = false;
           flipped =0;
           flag=0;
           see=0;
         }
          }
          
          
      }
    }
}

void shuffle()
{
  int temp = 0;
  int rand =0;
  for(int i=0;i<16;i++)
    {
      rand = int(random(0,16));
      temp = fv[i];
      fv[i] = fv[rand];
      fv[rand] = temp;
    }
}
