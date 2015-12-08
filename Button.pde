class Button
{
  float x, y;
  float xLen, yLen;
  String title;
  int colourR, colourG, colourB;
  boolean pressed = false;

  //Constructor
  Button(float x, float y, float xLen, float yLen, String title)
  {
    this.x = x;
    this.y = y;
    this.xLen = xLen;
    this.yLen = yLen;
    this.title = title;
    colourR = 200;
    colourG = 0;
    colourB = 0;
  }

  //method to draw button
  void drawButton()
  {
    // checking the status of the button then changing the colour depending
    if (pressed)
    {
      colourB = 0;
      colourR = 0;
      colourG = 200;
    } else
    {
      colourB = 0;
      colourR = 200;
      colourG = 0;
    }

    textSize(15);
    stroke(0);
    fill(colourR, colourG, colourB);

    rect(x, y, xLen, yLen);
    fill(0);
    textAlign(LEFT, TOP);
    text(title, x+5, y+5);

    buttonPressed();
  }

  //checking for mouse pressed

  void buttonPressed()
  {
    //checks to see if the mouse is contained within the button and it is false
    //then toggle it to true
    if (mousePressed && mouseX>x && mouseX<x+xLen && mouseY > y && mouseY < y+yLen && !pressed)
    {
      pressed = true;
      delay(120);
    }
    //checks if the mouse is withing the button and is true
    //then toggle it to false
    else if (mousePressed && mouseX>x && mouseX<x+xLen && mouseY > y && mouseY < y+yLen && pressed)
    {
      pressed = false;
      delay(120);
    }
  }
}