class NewGraph
{
  float centX, centY;
  ArrayList graph;
  float xBorder;
  float yBorder;

  NewGraph(ArrayList graph)
  {
    this.graph = graph;
    yBorder = 50;
    xBorder = 20;
  }

  void render()
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
    for (Esports y : esports)
    {
      if (y.players>max)
      {
        max = y.players;
      }
    }
    min = max;
    for (Esports y : esports)
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
    for (Esports y : esports)
    {
      fill(0);
      colourR = y.players%256;
      colourG = (y.players*2)%256;
      colourB = (sq(y.players))%256;
      stroke(colourR, colourG, colourB);

      for (int i = 0; i < y.players/quant; i++)
      {
        ellipse(centX, centY, w, w);
        line(x1, y1, x1, y2);
        line(x1-halfW, y1+halfW, x1+halfW, y1+halfW);
        line(x1, y2, x1-halfW, y2+halfW);
        line(x1, y2, x1+halfW, y2+halfW);
        x1+=w;
        centX += w;
      }
      textAlign(CENTER);
      textSize(50);
      fill(colourR, colourG, colourB);
      if (mouseY>centY-halfW && mouseY< y2+halfW)
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