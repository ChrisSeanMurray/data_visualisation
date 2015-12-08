class PieChart
{
  float centX, centY;
  float circleSize;
  ArrayList pie;
  float border;

  //constructor
  PieChart(ArrayList pie)
  {
    this.pie = pie;
  }

  //handling the graph
  void chartRender()
  {
    float total = 0.0f;
    fill(255);
    stroke(0);

    centX = width/2+200;
    centY = height/2;
    border = 100;
    circleSize = height-border;

    float colourR = 0;
    float colourG = 0;
    float colourB = 0;
    //mouse trackinhg to determine which segment of the pie chart the mouse is within
    // start of mouse tracking
    float toMouseX = mouseX - centX;
    float toMouseY = mouseY - centY;
    float angle = atan2(toMouseY, toMouseX);
    textSize(30);
    textAlign(CENTER);
    text("Esports Based on the prize money", centX, 30);

    if (angle < 0)
    {
      angle = map(angle, -PI, 0, PI, TWO_PI);
    }
    //end of mouse tracking

    //CALCULATING THE TOTAL
    for (Esports p : esports)
    {
      total += p.money;
    }

    float last = 0;
    float cumulative = 0;

    for (Esports p : esports)
    {
      //assigning random, yet repeatable values for coulors
      colourR = p.money%256;
      colourG = (p.money*2)%256;
      colourB = (sq(p.money))%256;
      fill(colourR, colourG, colourB);

      cumulative += p.money;
      float current = map(cumulative, 0, total, 0, TWO_PI);
      //using the mouse mapping from above to cehck the mouse position and print out the appropriate text
      if (angle > last && angle < current)
      {
        textSize(20);
        textAlign(LEFT);
        text(p.name, 0, height/3);
        text("Number of active players "+p.players, 0, height/3+20);
        text("Number of Tournaments "+p.tourns, 0, height/3+40);
        //reducing the number for prize money to be more readable
        if (p.money>1000000)
        {
          text("Prize money in millions $"+String.format("%.2f", p.money/1000000), 0, height/3+60);
        } else
        {
          text("Prize money $"+p.money, 0, height/3+60);
        }
      }
      //drawing the segments
      arc(centX, centY, circleSize, circleSize, last, current);
      last = current;
    }
  }
}