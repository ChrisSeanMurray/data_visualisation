ArrayList<YearlyData> yearlyData = new ArrayList<YearlyData>();//declaring a new arraylist of type YearlyData
ArrayList<Esports> esports = new ArrayList<Esports>();//declaring a new arraylist of type Esports
LineGraph yearlyGraph;
LineGraph esportGraph;
Button lineButton;
Button homeButton;
Button lineYearly;
Button lineEsport;
//Button esportButton;


void setup()
{
 size(displayWidth, displayHeight); 
 loadData();

 lineButton = new Button(100,0,100,30,"Line Graph");
 homeButton = new Button(0,0,100,30,"Home");
 lineYearly = new Button(100,30,100,30,"Yearly Trend");
 lineEsport = new Button(200,30,100,30,"2015 Trend");
 
  
 yearlyGraph = new LineGraph(yearlyData);
 esportGraph = new LineGraph(esports);
 

}

void draw()
{
  background(0);
  homeButton.drawButton();
  lineButton.drawButton();
  homeButton.pressed = true;
  
  
  //button switching, not quite working how i want it to
  if(lineButton.pressed)
 {
   lineEsport.drawButton();
   lineYearly.drawButton();
   if(lineYearly.pressed)
   {
     //drawing th line yearlyGraph
     yearlyGraph.render();
     yearlyGraph.renderYearly();
   }
   if(lineEsport.pressed)
   {
     esportGraph.render();
     esportGraph.render2015();
   }
   
   homeButton.pressed = false;
 }
  if(homeButton.pressed)
 {
   lineButton.pressed = false;
 }
 
}

void loadData()//loading the data from yearly_total.txt into a new object
{
  String[] lines = loadStrings("yearly_totals.txt");
  for(int i = 0; i <lines.length; i++)
  {
    YearlyData yearly = new YearlyData(lines[i]);
    yearlyData.add(yearly);//adding the object yearly into the arraylist
  }
  
  String[] eLines = loadStrings("top_games_2015.txt");//loading the data from top_games_2015.txt into a new object
  for(String s:eLines)
  {
    Esports esport = new Esports(s);
    esports.add(esport);//adding the object esport into the arraylist
  }
}
  
  