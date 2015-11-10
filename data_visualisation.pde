ArrayList<YearlyData> yearlyData = new ArrayList<YearlyData>();
ArrayList<Esports> esports = new ArrayList<Esports>();
LineGraph graph;


void setup()
{
 size(displayWidth, displayHeight); 
 background(0);
 loadData();
 graph = new LineGraph(yearlyData, 5);
}

void draw()
{
  graph.render();
  
}

void loadData()
{
  String[] lines = loadStrings("yearly_totals.txt");
  for(int i = 0; i <lines.length; i++)
  {
    YearlyData yearly = new YearlyData(lines[i]);
    yearlyData.add(yearly);
  }
  
  String[] eLines = loadStrings("top_games_2015.txt");
  for(int i = 0; i <lines.length; i++)
  {
    Esports esport = new Esports(eLines[i]);
    esports.add(esport);
  }
}
  
  