class BrushButton
{
  float x;
  float y;
  int size = 50;
  
  BrushButton(int X, int Y, int Size)
  {
    x = X;
    y = Y;
    size = Size;
  }
  
  void drawButton() 
  { 
    fill(brushCol);
    noStroke();
    circle(x, y, size);
  }
  
  void checkButton() 
  {
    float dist = sqrt(sq(x-mouseX)+sq(y-mouseY));
    if(dist <= (size/2))
    { 
      fill(200);
      circle(x, y, size);
      brushSize = size;
    } 
  }
}
