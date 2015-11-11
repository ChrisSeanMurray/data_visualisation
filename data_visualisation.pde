ArrayList<YearlyData> yearlyData = new ArrayList<YearlyData>();//declaring a new arraylist of type YearlyData
ArrayList<Esports> esports = new ArrayList<Esports>();//declaring a new arraylist of type Esports
LineGraph graph;
Button lineButton;
Button homeButton;
//Button esportButton;


void setup()
{
 size(displayWidth, displayHeight); 
 loadData();

 lineButton = new Button(100,0,100,30,"Line Graph");
 homeButton = new Button(0,0,100,30,"Home");
 //esportButton = new Button(200,0,100,30,"Esport");
  
 graph = new LineGraph(yearlyData, 5);
 

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
  graph.render();//drawing th line graph
  graph.renderYearly();
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
  for(int i = 0; i <lines.length; i++)
  {
    Esports esport = new Esports(eLines[i]);
    esports.add(esport);//adding the object esport into the arraylist
  }
}
  
  