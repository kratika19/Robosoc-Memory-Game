class Car
{
  PImage cardImage;
  int show =0;
  //int cardWidth = 105;
  //int cardHeight= 130;
  int cardX = 0;
  int cardY = 0;
  int faceValue = 0;
  String[] cardName = {"0.jpg","1.jpg","2.jpg","3.jpg","4.jpg","5.jpg","6.jpg","7.png","8.png","9.jpg","10.jpeg"};
  
  Car(int x, int y, int fv)
  {
    cardX = x;
    cardY = y;
    faceValue = fv;
  }
  void display()
  {
    cardImage = loadImage(cardName[show]);
    image(cardImage, cardX, cardY);
  }
  void displayFront()
  {
    show = faceValue;
  }
  void faceDown()
  {
    show = 0;
  }
  void matched()
  {
    cardX = -200;
  }
}
