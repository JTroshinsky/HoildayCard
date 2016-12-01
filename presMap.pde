PShape map;
PShape alabama;
PShape alaska;
PShape arizona;
PShape arkansas;
PShape california;
PShape colorado;
PShape connecticut;
PShape delaware;
PShape florida;
PShape georgia;
PShape hawaii;
PShape idaho;
PShape illinois;
PShape indiana;
PShape iowa;
PShape kansas;
PShape kentucky;
PShape louisiana;
PShape maine;
PShape maryland;
PShape massachusetts;
PShape michigan;
PShape minnesota;
PShape mississippi;
PShape missouri;
PShape montana;
PShape nebraska;
PShape nevada;
PShape newHampshire;
PShape newJersey;
PShape newMexico;
PShape newYork;
PShape northCarolina;
PShape northDakota;
PShape ohio;
PShape oklahoma;
PShape oregon;
PShape pennsylvania;
PShape rhodeIsland;
PShape southCarolina;
PShape southDakota;
PShape tennessee;
PShape texas;
PShape utah;
PShape vermont;
PShape virginia;
PShape washington;
PShape westVirginia;
PShape wisconsin;
PShape wyoming;
PShape washingtonDC;

PImage play;
PImage pause;

ArrayList<state> states=new ArrayList<state>();
int[][] results=new int[51][31];
boolean auto=true;
int counter=26;
int timer=0;
int year;
PFont font;
color red=color(195, 55, 77);
color blue=color(50, 74, 139);

void setup() {
  size(1000, 830);
  frameRate(30);
  font=loadFont("SegoeUI-75.vlw");
  textFont(font);  
  
  play=loadImage("play.png");
  pause=loadImage("pause.png");

  loadStates();
  loadResults();
  
  smooth();
}

void draw() {
   
  if(auto)
    timer();
  else
    slider();

  drawMap(); 
}

public void timer(){
  if(timer%15==0)
    counter--;
  if(counter<0){
    counter=26;
  }    
  year=2012-4*counter;
  timer++;
}

public void slider(){
  if(mousePressed&&mouseY>700&&mouseX>100&mouseX<900){
     counter=(mouseX-100)/30;
     year=2012-4*counter;
  }  
}

void mouseClicked(){
  if(mouseX>20&&mouseX<70&&mouseY>715){
    if(auto)
      auto=false;
    else
      auto=true;
  }
}

public void drawMap(){
  fill(42, 54, 86);
  background(42, 54, 86);
  strokeWeight(4);
  line(0,700,1000,700);
  line(100,750,900,750);
  rect(counter*30+100,730,20,40);
  strokeWeight(1);
  
  shape(map, 0, 0);
  map.disableStyle();
  fill(0);
  textSize(75);
  text(year,400,670);
  textSize(30);
  text("Press pause to move slider",20,820);
  
  for(int x=0;x<states.size();x++){    
    if(results[x][counter]==0)
      fill(#B6B6BC);
    if(results[x][counter]==1)
      fill(blue);
    if(results[x][counter]==2)
      fill(red);
     shape(states.get(x).getShape(),0,0);
     findClosestPoint(states.get(x).getShape());
  }
  if(auto)
    image(pause,20,730);
   else  
     image(play,20,730);
}

public void findClosestPoint(PShape sShape){
  
    
  
}

public void loadResults(){
  String[]wholeList=loadStrings("results.txt");   
  for(int x=0;x<wholeList.length;x++){
  int numEntries=0;  
  String[]line=wholeList[x].split(","); 
   for(int y=0;numEntries<31;y++){
     if(line[y].equals("NA")||line[y].equals("D+")||line[y].equals("R+")){
       if(line[y].equals("NA"))        
         results[x][numEntries]=0;
       if(line[y].equals("D+"))       
         results[x][numEntries]=1;       
       if(line[y].equals("R+"))         
         results[x][numEntries]=2;            
       numEntries++; 
       
     }
   }
  }
}


public void loadStates() {
  map=loadShape("Blank_Map.svg");

  alabama=map.getChild("AL");
  alaska=map.getChild("AK");
  arizona=map.getChild("AZ");
  arkansas=map.getChild("AR");
  california=map.getChild("CA");
  colorado=map.getChild("CO");
  connecticut=map.getChild("CT");
  delaware=map.getChild("DE");
  florida=map.getChild("FL");
  georgia=map.getChild("GA");
  hawaii=map.getChild("HI");
  idaho=map.getChild("ID");
  illinois=map.getChild("IL");
  indiana=map.getChild("IN");
  iowa=map.getChild("IA");
  kansas=map.getChild("KS");
  kentucky=map.getChild("KY");
  louisiana=map.getChild("LA");
  maine=map.getChild("ME");
  maryland=map.getChild("MD");
  massachusetts=map.getChild("MA");
  michigan=map.getChild("MI");
  minnesota=map.getChild("MN");
  mississippi=map.getChild("MS");
  missouri=map.getChild("MO");
  montana=map.getChild("MT");
  nebraska=map.getChild("NE");
  nevada=map.getChild("NV");
  newHampshire=map.getChild("NH");
  newJersey=map.getChild("NJ");
  newMexico=map.getChild("NM");
  newYork=map.getChild("NY");
  northCarolina=map.getChild("NC");
  northDakota=map.getChild("ND");
  ohio=map.getChild("OH");
  oklahoma=map.getChild("OK");
  oregon=map.getChild("OR");
  pennsylvania=map.getChild("PA");
  rhodeIsland=map.getChild("RI");
  southCarolina=map.getChild("SC");
  southDakota=map.getChild("SD");
  tennessee=map.getChild("TN");
  texas=map.getChild("TX");
  utah=map.getChild("UT");
  vermont=map.getChild("VT");
  virginia=map.getChild("VA");
  washington=map.getChild("WA");
  westVirginia=map.getChild("WV");
  wisconsin=map.getChild("WI");
  wyoming=map.getChild("WY");
  washingtonDC=map.getChild("DC");

  states.add(new state(alabama, 0));
  states.add(new state(alaska, 1));
  states.add(new state(arizona, 2));
  states.add(new state(arkansas, 3));
  states.add(new state(california, 4));
  states.add(new state(colorado, 5));
  states.add(new state(connecticut, 6));
  states.add(new state(delaware, 7));
  states.add(new state(florida, 8));
  states.add(new state(georgia, 9));
  states.add(new state(hawaii, 10));
  states.add(new state(idaho, 11));
  states.add(new state(illinois, 12));
  states.add(new state(indiana, 13));
  states.add(new state(iowa, 14));
  states.add(new state(kansas, 15));
  states.add(new state(kentucky, 16));
  states.add(new state(louisiana, 17));
  states.add(new state(maine, 18));
  states.add(new state(maryland, 19));
  states.add(new state(massachusetts, 20));
  states.add(new state(michigan, 21));
  states.add(new state(minnesota, 22));
  states.add(new state(mississippi, 23));
  states.add(new state(missouri, 24));
  states.add(new state(montana, 25));
  states.add(new state(nebraska, 26));
  states.add(new state(nevada, 27));
  states.add(new state(newHampshire, 28));
  states.add(new state(newJersey, 29));
  states.add(new state(newMexico, 30));
  states.add(new state(newYork, 31));
  states.add(new state(northCarolina, 32));
  states.add(new state(northDakota, 33));
  states.add(new state(ohio, 34));
  states.add(new state(oklahoma, 35));
  states.add(new state(oregon, 36));
  states.add(new state(pennsylvania, 37));
  states.add(new state(rhodeIsland, 38));
  states.add(new state(southCarolina, 39));
  states.add(new state(southDakota, 40));
  states.add(new state(tennessee, 41));
  states.add(new state(texas, 42));
  states.add(new state(utah, 43));
  states.add(new state(vermont, 44));
  states.add(new state(virginia, 45));
  states.add(new state(washington, 46));
  states.add(new state(westVirginia, 47));
  states.add(new state(wisconsin, 48));
  states.add(new state(wyoming, 49));
  states.add(new state(washingtonDC, 50));
}

class state {
  private PShape shape;
  private String name;
  private String abbreviation;


  public state(PShape stateShape,int num){
    String[] states=loadStrings("states.txt");    
    String[] stateStuff=states[num].split(" ");
    shape=stateShape;
    name=stateStuff[0];
    abbreviation=stateStuff[1];
  }
  
  public PShape getShape() {
    return shape;
  }
  public String getStateName() {
    return name;
  }
  public String getAbbreviation() {
    return abbreviation;
  }
}
