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
    
    centX = width/2;
    centY = height/2;
    border = 60;
    circleSize = height-border;
    
    float colourR = 0;
    float colourG = 0;
    float colourB = 0;
    
    float toMouseX = mouseX - centX;
    float toMouseY = mouseY - centY;
    float angle = atan2(toMouseY,toMouseX);
    
    if(angle < 0)
    {
      angle = PI - angle;
    }
    
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
        text(p.name,30,height/3);
        text(p.money,30,height/3+30);
      }
    
      arc(centX,centY,circleSize,circleSize,last,current);
      last = current;
    }
  }
}