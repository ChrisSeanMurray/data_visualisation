ArrayList<YearlyData> yearlyData = new ArrayList<YearlyData>();//declaring a new arraylist of type YearlyData
ArrayList<Esports> esports = new ArrayList<Esports>();//declaring a new arraylist of type Esports
LineGraph graph;
Button lineButton;


void setup()
{
 size(displayWidth, displayHeight); 
 loadData();

 lineButton = new Button(0,0,100,30,"Line Graph");
  
 graph = new LineGraph(yearlyData, 5);
 

}

void draw()
{
  background(0);
  if(lineButton.pressed)
 {
  graph.render();//drawing th line graph
  graph.renderYearly();
 }
  lineButton.drawButton();
  lineButton.buttonPressed();
  
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
  
  