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