class Buttons
{
  ArrayList <BrushButton> brushButtons = new ArrayList <BrushButton>();
  ArrayList <ColButton> colButtons = new ArrayList <ColButton>();
  ArrayList <BgButton> bgButtons = new ArrayList <BgButton>();
  WipeButton wipeBut;
  SymetryButton symetryBut;
  
  int toolMidX;
  int toolMidY;
  
  Buttons() 
  {
    toolMidY = pixelHeight/2;
    toolMidX = pixelWidth - (toolbarSize/2);
    int padding = int(toolbarSize/4); //TODO should probably use toolbar not screensize/21
    int butSize = int(toolbarSize/4);
    int cols = int(toolbarSize / (padding + butSize));
    int incrementX = int(toolbarSize/2.5);
    int incrementY = (toolMidY-(padding*2))/ceil(Colours.length/cols); //TODO change method depending on width if rows should be two or how many sizes
    int butX = toolMidX + (incrementX/2);
    int butY = 0;
    for(int i = 0; i < Colours.length; i++)
    {
      if(i % cols == 0) //if i = even y += increment TODO changed to cols, will this work???
      {
        butY += incrementY;
        butX -= incrementX;
      }
      else //if i = odd x + increment
      {
        butX += incrementX;
        
      }
      colButtons.add(new ColButton(butX, butY, Colours[i], butSize));
    }
    incrementY = (toolMidY - (padding*2))/4;
    //Bg colour buttons
    butSize = toolbarSize/5;
    butY = toolMidY + incrementY;
    incrementX = int(toolbarSize/3.5);
    butX = toolMidX - incrementX;
    for(int i = 0; i < BgColours.length; i++)
    {
      bgButtons.add(new BgButton(butX + (incrementX*i), butY, BgColours[i], butSize));
    }
    //Draw erase button
    int butLength = int(toolbarSize / 2.5);
    butSize = toolbarSize/5;
    butX = toolMidX-(butLength/2); 
    butY += incrementY-butSize;
    wipeBut = new WipeButton(butX,butY,butLength,butSize);
    //draw Brush Buttons
    butY += incrementY;
    incrementX = int(toolbarSize / 16.5); //used to be 12
    butX = toolMidX - ((incrementX)*Brushes.length);
    for(int i = 0; i < Brushes.length; i++)
    {
      brushButtons.add(new BrushButton(butX + ((incrementX+(i*2))*i), butY, Brushes[i]));
    }
    //Symetry button
    butSize = int(toolbarSize/2);
    butX = toolMidX;
    butY += incrementY;
    symetryBut = new SymetryButton(butX,butY,butSize);
  }
  
  void drawButtons() 
  { 
    //Buttons - brush colours - black, white, red, green, blue, yellow, purple
    for(int i = 0; i < colButtons.size(); i++)
    {
      colButtons.get(i).drawButton();
    }
    //Rubber
    wipeBut.drawButton();
    //Brush size buttons
    for(int i = 0; i < brushButtons.size(); i++)
    {
      brushButtons.get(i).drawButton();
    }
    //Symetry Button
    symetryBut.drawButton();
    //bg Buttons
    for(int i = 0; i < bgButtons.size(); i++)
    {
      bgButtons.get(i).drawButton();
    }
  }
  
  void checkButtons() 
  {
    for(int i = 0; i < colButtons.size(); i++)
    {
      colButtons.get(i).checkButton(); //TODO change to just directly taking value
    }
    wipeBut.checkButton();
    for(int i = 0; i < brushButtons.size(); i++)
    {
      brushButtons.get(i).checkButton(); //TODO change to just directly taking value
    }
    symetryBut.checkButton();
    for(int i = 0; i < bgButtons.size(); i++)
    {
      bgButtons.get(i).checkButton();
    }
  }
}
