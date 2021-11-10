class WipeButton
{
  float x;
  float y;
  int xSize;
  int ySize;
  boolean over = false;
  
  WipeButton(int X, int Y, int XSize, int YSize)
  {
    x = X;
    y = Y;
    xSize = XSize;
    ySize = YSize;
  }
  
  void drawButton() 
  { 
    if (mouseX > x && mouseX < x+xSize && 
      mouseY > y && mouseY < y+ySize)
    {
      over = true;  
      noStroke();
      fill(200);
      strokeWeight(2);
      rect(x,y,xSize,ySize);
      fill(100);
      rect(x+(xSize/3),y,xSize-(xSize/3),ySize);
    }
    else
    {
      over = false;
      noStroke();
      fill(255);
      strokeWeight(2);
      rect(x,y,xSize,ySize);
      fill(200);
      rect(x+(xSize/3),y,xSize-(xSize/3),ySize);
    }
  }
  
  void checkButton() 
  {
    if(over) 
    { 
      background(bgColour);
    } 
  }
}
