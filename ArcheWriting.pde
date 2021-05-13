import processing.svg.*;
JSONArray json;

void setup() {

  json = loadJSONArray("data.json");
  
  int[] values = json.getIntArray();
  
  int len = values.length;
  
  
  
  int w = floor(sqrt(len));
  int h = ceil(len / w);
  
  size(1400, 1400, P2D);
  
  beginRecord(SVG, "data-###.svg");
  
  // background(0);
  
  PFont f = createFont("Arial", 32);
  textFont(f);
  textSize(15);
  fill(0);
  stroke(0);
  int x = 0;
  int y = 10;
  for(int i = 0; i< len; i++) {
    char c = char(values[i]);
    text(c, x, y);
    x+= 20;
    if (x > width) {
     x=0;
     y+=20;
    }
    
  }
  
  // saveFrame();
  
  endRecord();
}

// Sketch prints:
// 0, Panthera leo, Lion
