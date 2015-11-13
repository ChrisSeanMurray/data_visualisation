class PieChart
{
  float centX,centY;
  float circleSize;
  ArrayList pie;
  float border;
  
  PieChart(ArrayList pie)
  {
    this.pie = pie;
  }
  
  
  void chartRender()
  {
    float total = 0.0f;
    fill(255);
    stroke(0);
    
    centX = width/2+200;
    centY = height/2;
    border = 60;
    circleSize = height-border;
    
    float colourR = 0;
    float colourG = 0;
    float colourB = 0;
    
    float toMouseX = mouseX - centX;
    float toMouseY = mouseY - centY;
    float angle = atan2(toMouseY,toMouseX);
    textSize(30);
    textAlign(CENTER);
    text("Esports Based on the player base",centX,30);
    
    if(angle < 0)
    {
      angle = map(angle, -PI, 0, PI, TWO_PI);
    }
    
    println(angle);
    
    for(Esports p:esports)
    {
      total += p.players;
    }
    
    float last = 0;
    float cumulative = 0;
    
    for(Esports p:esports)
    {
      colourR = p.players%256;
      colourG = (p.players*2)%256;
      colourB = (sq(p.players))%256;
      fill(colourR,colourG,colourB);
      
      cumulative += p.players;
      float current = map(cumulative,0,total,0,TWO_PI);
      
      if(angle > last && angle < current)
      {
        textSize(20);
        textAlign(LEFT);
        text(p.name,0,height/3);
        text("Number of active players "+p.players,0,height/3+20);
        text("Number of Tournaments"+p.tourns,0,height/3+40);
        if(p.money>1000000)
        {
          text("Prize money in millions $"+String.format("%.2f",p.money/1000000),0,height/3+60);
        }
        else
        {
          text("Prize money $"+p.money,0,height/3+60);
        }
      }
    
      arc(centX,centY,circleSize,circleSize,last,current);
      last = current;
    }
  }
}