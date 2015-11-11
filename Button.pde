class Button
{
  int x,y;
  int xLen,yLen;
  String title;
  int colourR,colourG,colourB;
  boolean pressed = false;
  
  //Constructor
  Button(int x,int y,int xLen,int yLen, String title)
  {
    this.x = x;
    this.y = y;
    this.xLen = xLen;
    this.yLen = yLen;
    this.title = title;
    colourR = 255;
    colourG = 255;
    colourB = 255;
  }
  
  //method to draw button
  void drawButton()
  {
    stroke(0);
    fill(colourR,colourG,colourB);
    
    rect(x,y,xLen,yLen);
    fill(0);
    textAlign(LEFT,TOP);
    text(title,x+5,y+5);
    
  }
  
  //checking for mouse pressed
  
  void buttonPressed()
  {
    
    if(mousePressed && mouseX>x && mouseX<x+xLen && mouseY > y && mouseY < y+yLen && !pressed)
      {
        colourB = 200;
        colourR = 0;
        colourG = 0;
        pressed = true;
        delay(120);
        
      }
      else if(mousePressed && mouseX>x && mouseX<x+xLen && mouseY > y && mouseY < y+yLen && pressed)
      {
        colourB = 255;
        colourR = 255;
        colourG = 255;
        pressed = false;
        delay(120);
        
      }
    
  }
}