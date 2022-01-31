import processing.svg.*;
JSONArray json;

int marginX = 50;
int marginY = 50;

boolean draw_rects = false; 

int w = 1280;
int h = 1748;

float start_percentage_size = 0.05;

PFont font;

String[] result;

void setup() {
  
  
  String[] lines = loadStrings("text/91.txt");
  String text = lines[0];
  result = text.split("");
  
  float percentage_size = getPercentageSize(start_percentage_size);

  println("percentage_size", percentage_size);

  beginRecord(SVG, "data-###.svg");
  size(1280, 1748, P2D);
  
  background(255);
  
  stroke(0);
  fill(0);

  float c_w =  percentage_size * w;
  float c_h = c_w;

  font = createFont("Arial",32,true);
  textFont(font);
  textAlign(CENTER, CENTER);
  textSize(c_h*0.75);

  int x = marginX;
  int y = marginY;
  for (int i = 0; i < result.length; i++) {
    if (x >= w-marginX) {
      x = marginX;
      y+= c_h;
    }
    float x2 = x+c_w;
    float y2 = y+c_h;
    String c = result[i];
    stroke(0);
    fill(0);
    text(c,x,y,c_w,c_h);
    if (draw_rects) {
      colorMode(HSB);
      stroke(random(255), 255, 255);
      noFill();
      rect(x,y,c_w,c_h);
    }
    x+=c_w;
  }
  endRecord();  
}

float getPercentageSize (float start_percentage_size) {
  float p = start_percentage_size;
  while (getLastY(p) >= h) {
    p-=0.002;
  }
  return p; 
}

int getLastY (float p) {
  float c_w =  p * w;
  float c_h = c_w;
  int x = marginX;
  int y = marginY;
  println(marginX, marginY);
  for (int i = 0; i < result.length; i++) {
    if (x >= w-c_w*2-marginX) {
      x = marginX;
      y+= c_h;
    }
    x+=c_w;
    float x2 = x+c_w;
    float y2 = y+c_h;
    fill(random(255), 255, 255);
    // rect(x,y,c_w,c_h);
  }
  return y;
}