class Esports
{
  String name;
  float money;
  int players;
  int tourns;

  Esports(String line)//Constructor
  {
    String[] parts = line.split("\t");
    name = parts[0];
    money = Float.parseFloat(parts[1]);
    players = Integer.parseInt(parts[2]);
    tourns = Integer.parseInt(parts[3]);
  }
}