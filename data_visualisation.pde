ArrayList<YearlyData> yearlyData = new ArrayList<YearlyData>();//declaring a new arraylist of type YearlyData
ArrayList<Esports> esports = new ArrayList<Esports>();//declaring a new arraylist of type Esports
ArrayList<Button> buttons = new ArrayList<Button>();
LineGraph yearlyGraph;
Button lineButton;
Button pieEsport;
PieChart esportPie;
NewGraph esportGraph;
Button graphButton;


void setup()
{
  size(displayWidth, displayHeight); 
  loadData();
  float buttonSize = 100;

  lineButton = new Button(0, 0, buttonSize, 30, "Line Graph");
  pieEsport = new Button(100, 0, buttonSize, 30, "Pie Chart");
  graphButton = new Button(200, 0, buttonSize, 30, "Other Graph");

  buttons.add(lineButton);
  buttons.add(pieEsport);
  buttons.add(graphButton);


  yearlyGraph = new LineGraph(yearlyData);
  esportPie = new PieChart(esports);
  esportGraph = new NewGraph(esports);

  graphButton.pressed = true;
}

void draw()
{
  int temp = 0;
  background(0);
  for (int i = 0; i < buttons.size(); i++)
  {
    buttons.get(i).drawButton();
  }


  //button switching, not quite working how i want it to
  if (lineButton.pressed)
  {
    //drawing th lineGraph
    yearlyGraph.renderYearly();
    pieEsport.pressed = false;
    graphButton.pressed = false;
  } else if (pieEsport.pressed)
  {
    //Calling the method to render the pie chart
    esportPie.chartRender();
    graphButton.pressed = false;
    lineButton.pressed = false;
  } else if (graphButton.pressed)
  {
    //calling the method to draw the graph
    esportGraph.render();
    pieEsport.pressed = false;
    lineButton.pressed = false;
  }
}

void loadData()//loading the data from yearly_total.txt into a new object
{
  String[] lines = loadStrings("yearly_totals.txt");
  for (int i = 0; i <lines.length; i++)
  {
    YearlyData yearly = new YearlyData(lines[i]);
    yearlyData.add(yearly);//adding the object yearly into the arraylist
  }

  String[] eLines = loadStrings("top_games_2015.txt");//loading the data from top_games_2015.txt into a new object
  for (String s : eLines)
  {
    Esports esport = new Esports(s);
    esports.add(esport);//adding the object esport into the arraylist
  }
}