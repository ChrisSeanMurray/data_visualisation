class LineGraph
{
  float border;
  float temp;
  float x1,x2;
  float y1, y2;
  float len;
  float xinc;
  float yinc;
  ArrayList graph;
  
  LineGraph(ArrayList graph, int index)
  {
    this.graph = graph;
   
  }
  
  public void render()
  {
    border = 60;
    len = graph.size();
    xinc = (width-border*2)/(len-1);
    yinc = (height-border*2)/(len-1);
    
    x1 = border;
    x2 = width - border;
    y1 = border;
    y2 = height - border;
    temp = x1;
    
    stroke(255);
    line(x1, y2, x2, y2);
    line(x1, y2, x1, y1);
    
    for(int i = 0; i < len; i++)
    {
      line(x1, y2, x1, y2+15);
      x1 += xinc;
      
    }
    for(int i = 0; i < len; i++)
    {
      line(temp,y2,temp-15,y2);
      y2 -= yinc;
    }
  }
  
}