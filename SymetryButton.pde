class SymetryButton
{
  float x;
  float y;
  int size = 50;
  
  SymetryButton(int X, int Y, int Size)
  {
    x = X;
    y = Y;
    size = Size;
  }
  
  void drawButton() 
  { 
    fill(100);
    noStroke();
    circle(x, y, size);
    float half =  size/2;
    stroke(200);
    fill(200);
    switch(symetry)
    {
      case 0:
        circle(x, y, size/10);
        break;
      case 1:
        line(x,y-half,x,y+half);
        break;
      case 2:
        line(x-half,y,x+half,y);
        break;
      case 3:
        noFill();
        circle(x, y, size/5);
        break;
      case 4:
        line(x-half,y,x+half,y);
        line(x,y-half,x,y+half);
        break;
      case 5:
        line(x-half,y,x+half,y);
        line(x,y-half,x,y+half);
        line(x+(half/1.5),y-(half/1.5),x-(half/1.5),y+(half/1.5));
        line(x-(half/1.5),y-(half/1.5),x+(half/1.5),y+(half/1.5));
        break;
      default:
        break;
    }
  }
  
  void checkButton() 
  {
    float dist = sqrt(sq(x-mouseX)+sq(y-mouseY));
    if(dist <= (size/2))
    { 
      fill(200);
      circle(x, y, size);
      print(symetry);
      if(symetry >= 5) 
      {
         symetry = 0;
      }
      else
      {
        symetry++;
      }
    } 
  }
}
