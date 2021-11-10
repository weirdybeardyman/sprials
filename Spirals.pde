int toolbarSize; 
float screenXMid; 
float screenYMid;
//Colours
color [] Colours = {color(0,0,0),color(255,255,255),color(255,0,0),color(0,255,0),color(0,0,255),color(255,128,0),color(255,255,0),color(0,255,255),color(128,0,255),color(255,0,255),color(128,128,128)};
int [] Brushes = {2,4,6,10,16,22,30};
color [] BgColours = {color(200), color(0),color(255)};

int symetry = 0;
color brushCol = (0);
int brushSize = 10; 
color bgColour = (200); //TODO add buttons for this

Buttons buts;

void setup()
{
  size(612,512);
  //fullScreen();
  orientation(LANDSCAPE); //ANDROID
  background(bgColour);
  toolbarSize = pixelWidth - pixelHeight;
  screenXMid = (pixelWidth - toolbarSize) / 2; //200 for toolbar width
  screenYMid = pixelHeight / 2;
  fill(155);
  noStroke();
  rect(pixelHeight,0,toolbarSize,pixelHeight);
  buts = new Buttons();
}

void draw()
{
  stroke(brushCol);
  strokeWeight(brushSize);
  if(mousePressed == true)
  {
    float x = mouseX;
    float y = mouseY;
    float px = pmouseX;
    float py = pmouseY;

    float xDiff = screenXMid - (x - screenXMid);
    float yDiff = screenYMid - (y - screenYMid);
    float pxDiff = screenXMid - (px - screenXMid);
    float pyDiff = screenYMid - (py - screenYMid);
    
    line(x,y,px,py); //Mouse pointer position
    
    if(symetry == 1) //Mirrored in Y axis
    {
      line(xDiff,y,pxDiff,py);
    }
    if(symetry == 2) //Mirrored in X axis
    {
      line(x,yDiff,px,pyDiff);  
    }
    if(symetry > 2) //Mirrored in X and Y axis
    {
      line(xDiff,yDiff,pxDiff,pyDiff);
    }
    if(symetry > 3) //Mirrored 4 times
    {
      line(xDiff,y,pxDiff,py);
      line(x,yDiff,px,pyDiff);  
    }
    if(symetry > 4) //Mirrored 8 times
    {
      //x and y swapped
      line(y,x,py,px);
      line(y,xDiff,py,pxDiff);
      line(yDiff,x,pyDiff,px);
      line(yDiff,xDiff,pyDiff,pxDiff); 
    }
  }
  
  //Toolbar drawing - TODO add labels, stroke buttons and display current settings
  fill(155);
  noStroke();
  rect(pixelHeight,0,toolbarSize,pixelHeight);
  buts.drawButtons();
}

void mousePressed() 
{
  buts.checkButtons();
}
