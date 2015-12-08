class NewGraph
{
  float centX, centY;
  ArrayList<Esports> graph;
  float xBorder;
  float yBorder;

  //contructor
  NewGraph(ArrayList<Esports> graph)
  {
    this.graph = graph;
    yBorder = 50;
    xBorder = 20;
  }

  void render()//method for handling the graph
  {
    float colourR, colourB, colourG;
    centX = xBorder;
    centY = yBorder;
    float x1 = xBorder;
    float y1;
    float y2;
    float quant;
    float w = 0;
    float max = 0;
    float min;
    float temp;

    //Getting the max value
    for (Esports y : graph)
    {
      if (y.players>max)
      {
        max = y.players;
      }
    }
    //getting the min value
    min = max;
    for (Esports y : graph)
    {
      if (y.players<min)
      {
        min = y.players;
      }
    }
    fill(255);
    textSize(40);
    textAlign(LEFT, TOP);
    text("Each man represesents "+int(min)+" players", width/3, 0);
    quant = min;
    w = (width-xBorder*2)/(max/quant);
    float halfW = w/2;

    y1 = yBorder + halfW;
    y2 = yBorder+w*1.5f;

    for (Esports y : graph)
    {
      fill(0);
      colourR = y.players%256;
      colourG = (y.players*2)%256;
      colourB = (sq(y.players))%256;
      stroke(colourR, colourG, colourB);
      temp = y.players;

      //drawing out the men
      for (int i = 0; i < y.players/quant; i++)
      {
        //determining whether to draw a full man
        if (temp >= min)
        {
          ellipse(centX, centY, w, w);
          line(x1, y1, x1, y2);
          line(x1-halfW, y1+halfW, x1+halfW, y1+halfW);
          line(x1, y2, x1-halfW, y2+halfW);
          line(x1, y2, x1+halfW, y2+halfW);
        } 
        //determining whether to draw a half man
        else if (temp < min)
        {
          arc(centX, centY, w, w, HALF_PI, PI+HALF_PI);
          line(x1, y1, x1, y2);
          line(x1-halfW, y1+halfW, x1, y1+halfW);
          line(x1, y2, x1-halfW, y2+halfW);
        }
        x1+=w;
        centX += w;
        temp = temp - min;
      }
      
      textAlign(CENTER);
      textSize(50);
      fill(colourR, colourG, colourB);
      //checking the mouse y co-ordinates to display the correct text on screen
      if (mouseY>centY-w && mouseY< y2+halfW)
      {
        text(y.name, width/2, height/2);
      }
      x1=xBorder;
      centX= xBorder;
      y1 += (height-yBorder*2)/graph.size();
      y2 += (height-yBorder*2)/graph.size();
      centY += (height-yBorder*2)/graph.size();
    }
  }
}