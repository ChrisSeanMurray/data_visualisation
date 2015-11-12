class LineGraph
{
  float border;
  float temp;
  float x1,x2;
  float y1, y2;
  float len;
  float xinc;
  ArrayList<YearlyData> yearlyGraph = new ArrayList<YearlyData>();
  float max;
  float map;
  float min;
  float mapped;
  float reduc;
  
  LineGraph(ArrayList graph)//Constructor
  {
    yearlyGraph = graph;
  }
  
  public void render()
  {
    border = 60;
    
    xinc = (width-border*2)/(len);
    
    x1 = border;
    x2 = (width - border);
    y1 = border;
    y2 = height - border;
    max = 0;
    
    stroke(255);
    line(x1, y2, x2, y2);//drawing the xAxis
    line(x1, y2, x1, y1);//drawing the yAxis
  }
 
  void renderYearly()
  {
    fill(255);
    textAlign(CENTER);
    textSize(30);
    text("Line Graph Showing the evolution of Esports based on number of players",width/2,border*3);
    len = yearlyGraph.size()-1;
    
    //a loop to determine the maximum value
    for(YearlyData y:yearlyGraph)
    {
      if(y.total_players>max)
      {
        max = y.total_players;
      }
    }
    
    min = max;
    //a for each loop to determin and assign the minmum value
    for(YearlyData y:yearlyGraph)
    {
      if(y.total_players<min)
      {
        min = y.total_players;
      }
    }
    
    x2+=xinc;
    temp = 0;
    for(YearlyData y:yearlyGraph)//this for loop plots the points on the graph
    {
      mapped = mapData(y.total_players,min,max);
      
      if(temp != 0)
      {
        stroke(0,0,120);
       line(x2-xinc,mapped,x2,temp); 
      }
      if(mouseX>border && mouseX<width-border && mouseY>border && mouseY<height-border)
      {
        stroke(120,0,0);
        if(mouseX<(x2-xinc)+(xinc/2) && mouseX>(x2-xinc)-(xinc/2))
        {
          fill(120,0,0);
          ellipse(x2-xinc,mapped,10,10);
          reduc = y.total_prize/1000000;
          
          textAlign(CENTER,BOTTOM);
          textSize(26);
          text("Total prize money in millions $"+String.format("%.2f",reduc),width/2,height/2-100);
          text("Total players : "+y.total_players,width/2,height/2-70);
          text("Total tournaments :  "+y.total_tourn,width/2,height/2-40);
          
        }
      }
      stroke(255);
      x2-=xinc;
      temp = mapped;
    }
    
    x2 = width-border;
    temp = x1;
    for(YearlyData y:yearlyGraph)//drawing the lines along the xAxis base
    {
      textSize(26);
      fill(255);
      line(x2, y2, x2, y2+15);
      textAlign(CENTER,TOP);
      text(y.year,x2,y2+10);
      x2 -= xinc;
    }
  }
  
  float mapData(float value, float min, float max)
  {
    float mappedData = map(value,min,max,height-border,border);
    return mappedData;
  }
}