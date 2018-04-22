//                            name = PAYLOAD_CALLSIGN  apikey = APRS.FI_API_KEY
//https://api.aprs.fi/api/get?name=KC0VRV-9&what=loc&apikey=107458.EVfeGawBrtSTImE&format=xml

JSONObject bal;

boolean initSetup = true;
boolean update = false;
int lastTime;

int count=-1;
ArrayList<point> dataList;
point newPoint;
point lastPoint;


void setup() {
  size(1000, 1000); 
  if (initSetup == true) {
    background(0);
    lastTime = second()+(minute()*60)+(hour()*60*60);
    dataList = new ArrayList<point>();
    lastPoint = new point();
  }

  bal = loadJSONObject("https://api.aprs.fi/api/get?name=HB9ONO-11&what=loc&apikey=107458.EVfeGawBrtSTImE&format=json");

  //String command = bal.getString("command");
  //String result = bal.getString("result");
  //String what = bal.getString("what");
  //int found = bal.getInt("found");

  JSONArray arr = bal.getJSONArray("entries");

  float lat = 0.0;
  float lng = 0.0;
  int alt = 0;
  int time = 0;

  for (int i = 0; i < arr.size(); i++) {    
    JSONObject comp = arr.getJSONObject(i); 

    float lat_ = comp.getFloat("lat");
    float lng_ = comp.getFloat("lng");
    int time_  = comp.getInt("time");
    int alt_ = (int)(comp.getInt("altitude")*3.28084);
    lat = lat_;
    lng = lng_;
    alt = alt_;
    time = time_;
  }  

  newPoint = new point(alt, lat, lng, time, lastPoint);

  if ((newPoint.alt!=lastPoint.alt)||(newPoint.lat!=lastPoint.lat)||(newPoint.lng!=lastPoint.lng))
    update = true;
  else
    update = false;

  if (update&&initSetup==false) {    
    newPoint.print();
    count++;
    dataList.add(newPoint);
  }

  lastPoint = newPoint;  

  initSetup = false;
  draw();
}

void draw() {
  int time=second()+(minute()*60)+(hour()*60*60);
  graph();
  if (time-lastTime>15) {
    lastTime = time;    

    setup();
  }
}
class point {

  public int alt;
  public float lat;
  public float lng;
  public int time;
  public int hour_;
  public int min_;
  public int sec_;
  public int longTime_;
  public float velocity;
  public point lastPoint;

  public point() {
    alt = 0;
    lat = 0;
    lng = 0;
    velocity = 0;
  }

  public point(int alt_, float lat_, float lng_,int time_, point lastPoint_) {
    alt = alt_;
    lat = lat_;
    lng = lng_;  
    time = time_;

    hour_= hour();
    min_= minute();
    sec_ = second();
    longTime_ = sec_+(min_*60)+(hour_*60*60);

    lastPoint = lastPoint_;

    velocity = (float)(alt-lastPoint.alt)/(time-lastPoint.time);
  }    

  public void print() {
    println("Time:"+hour_+":"+min_+":"+sec_+", Alt:"+alt+", Velocity:"+velocity+", Lat:"+lat+", Lng:"+lng);
  }
}

public void graph() {  
  fill(255);
  rect(0, 0, 1000, 1000);

  fill(0);
  textAlign(CENTER);
  text("Time", 500, 950);
  textAlign(CENTER);  
  text("Velocity", 50, 500);

  if (count>0) {
    float min=1000000, max=-1000000, gHeight, gWidth;
    float[][] graph = new float[dataList.size()][1];
    
    int z;
    if(dataList.size()>20)
      z=dataList.size()-20;
    else 
      z=0;
    for (int x=z; x<dataList.size(); x++) {
      graph[x][0]=dataList.get(x).velocity;

      if (dataList.get(x).velocity<min)
        min = dataList.get(x).velocity;
      if (dataList.get(x).velocity>max)
        max = dataList.get(x).velocity;
    }

    if(dataList.size()>20)
      z=20;
    else 
      z=dataList.size();

    gHeight = 800/(max-min);
    gWidth = 800/(z-1); 

    translate(150, 900);
    
    int limit=0;
    if(count>19){
      z=count-20;
      limit=20;
    }
    else {
      z=0;
      limit = graph.length;
    }

    float x, y, lx=0, ly=0;
    for (int i=0; i<limit; i++) {
      x=i*gWidth;
      y=-1*gHeight*(graph[z][0]-min);
      fill(#F56F6F);
      ellipse(x, y, 20, 20);
      if (i>0)
        line(x, y, lx, ly);
      lx=x;
      ly=y;
      z++;
    } 

    for (int i=0; i<9; i++) {
      fill(0);
      y = i*100*-1; 
      float yLab = (((y/-1)/gHeight)+min);
      text(yLab, -50, y);
    }
  }
}