class PieChart
{
  float theta;
  float centX,centY;
  float circleSize;
  float thetaInc;
  ArrayList pie;
  float border;
  float total;
  
  PieChart(ArrayList pie)
  {
    this.pie = pie;
  }
  
  
  void chartRender()
  {
    total = 0;
    fill(255);
    stroke(0);
    centX = width/2;
    centY = height/2;
    border = 60;
    theta = 0;
    circleSize = height-border;
    float colourR = 0;
    float colourG = 0;
    float colourB = 0;
    
    for(Esports p:esports)
    {
      total += p.players;
    }
    
    for(Esports p:esports)
    {
      colourR = p.players%256;
      colourG = (p.players*2)%256;
      colourB = (sq(p.players))%256;
      fill(colourR,colourG,colourB);
      thetaInc = (TWO_PI/total)*p.players;
      arc(centX,centY,circleSize,circleSize,theta,theta+thetaInc);
      theta +=thetaInc;
    }
  }
}