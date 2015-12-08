# data_visualisation
My first semester assignment for OOP.

For the assignment I plan on showing the evolution of Esports for the years 2000-2015.

I am also planning on using the data collected so far for this year,2015, to show which Esports
have been the most/least successful and which ones have the largest player base in the esport scene.

The program I have written, reads in the data from the data sheets I have inside the data folder.
Each of my graphs use the mouse to hover over the graph to display more data about the graph.

it then uses that data to create 3 different graphs which are toggled between by the use of buttons.
The buttons I made using a button class and creating new instances of the button class whenever I needed a new one.
I ran into some problems with the button switching that I wasn't quite able to solve, they toggle absolutely fine if going from right to left, however to toggle left to right you need to turn off the button for what page you are currently on.

I made a trend/line graph to show the progression of the popularity of esports from the year200 up to what data had already been collected for this year(2015). I based this graph off of the player base in the professional esport scene as I felt like this was the best was the best data to base the diagram on.

I made a pie chart to illustrate how much each of the top 20 esport titles from 2015 had earned in cash prizes.

The third graph I used to show the number of people currently playing for each Title in esports,I did this by drawing out man shapes side by side to represent a number of players, the base number I calculated to be the minimum value, that way every Title would have at least one full man shape.
If the Title had a number of players not divisible by the minimum I would give them full man shapes up until the last one, which would be a half-man shape.
 
