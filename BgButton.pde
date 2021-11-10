class BgButton
{
  float x;
  float y;
  int size = 50;
  boolean over = false;
  color colour; 
  
  BgButton(int X, int Y, color Colour, int Size)
  {
    x = X;
    y = Y;
    colour = Colour;
    size = Size;
  }
  
  void drawButton() 
  { 
    float dist = sqrt(sq(x-mouseX)+sq(y-mouseY));
    if(dist <= (size/2))
    {
      over = true;  
      stroke(255); 
      fill(colour);
    }
    else
    {
      over = false;
      stroke(colour);
      fill(colour);
    }
    strokeWeight(2);
    circle(x, y, size);
  }
  
  void checkButton() 
  {
    if(over) 
    { 
      fill(200);
      circle(x, y, size);
      bgColour = colour;
      background(bgColour);
    } 
  }
}
