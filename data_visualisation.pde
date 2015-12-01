ArrayList<YearlyData> yearlyData = new ArrayList<YearlyData>();//declaring a new arraylist of type YearlyData
ArrayList<Esports> esports = new ArrayList<Esports>();//declaring a new arraylist of type Esports
LineGraph yearlyGraph;
Button lineButton;
Button homeButton;
Button pieEsport;
PieChart esportPie;
NewGraph esportGraph;
Button graphButton;
//Button esportButton;


void setup()
{
  size(displayWidth, displayHeight); 
  loadData();

  lineButton = new Button(100, 0, 100, 30, "Line Graph");
  homeButton = new Button(0, 0, 100, 30, "Home");
  pieEsport = new Button(200, 0, 100, 30, "Pie Chart");
  graphButton = new Button(300, 0, 100, 30, "Other Graph");


  yearlyGraph = new LineGraph(yearlyData);
  esportPie = new PieChart(esports);
  esportGraph = new NewGraph(esports);

  pieEsport.pressed = true;
}

void draw()
{
  background(0);
  homeButton.drawButton();
  lineButton.drawButton();
  pieEsport.drawButton();
  graphButton.drawButton();
  if (homeButton.pressed)
  {
    fill(255);
    textAlign(CENTER);
    textSize(40);
    text("WELCOME TO THE HOME SCREEN", width/2, height/3);
    text("PLEASE SELCT WHICH GRAPH YOU WOULD LIKE TO VIEW", width/2, height/3+50);
    lineButton.pressed = false;
    pieEsport.pressed = false;
    graphButton.pressed= false;
  }
  //button switching, not quite working how i want it to
  if (lineButton.pressed)
  {
    //drawing th line yearlyGraph
    yearlyGraph.renderYearly();
    homeButton.pressed = false;
    pieEsport.pressed = false;
    graphButton.pressed= false;
  }

  if (pieEsport.pressed)
  {
    esportPie.chartRender();
    homeButton.pressed = false;
    lineButton.pressed = false;
    graphButton.pressed= false;
  }
  if (graphButton.pressed)
  {
    esportGraph.render();
    homeButton.pressed = false;
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