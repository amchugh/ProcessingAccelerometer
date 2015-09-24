import processing.serial.*;

Serial myPort;  // Create object from Serial class
String val;     // Data received from the serial port

void setup() {
  size(1000,1000);
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 115200);
  background(255);
}

String oldTestNum,oldX,oldY,oldZ;

void draw()
{
  String testNum = null;
  String rawX = null;
  String rawY = null;
  String rawZ = null;
  
  if ( myPort.available() > 0) {
    testNum = myPort.readStringUntil(' ');
    rawX = myPort.readStringUntil(' ');
    rawY = myPort.readStringUntil(' ');
    rawZ = myPort.readStringUntil('\n');
  }
  
  //Make the text
  fill(255);
  noStroke();
  rect(0,0,250,125);
  
  textSize(20);
  fill(0);
  
  if (testNum == null) {
    testNum = oldTestNum;
  }
  text("Test Number: " + testNum, 0,25);
  oldTestNum = testNum;
  
  //Make the rawX text
  fill(255,0,0);
  if (rawX == null) {
    rawX = oldX;
  }
  text("X: " + rawX, 10,50);
  oldX = rawX;
  
  //Make the rawY text
  fill(0,255,0);
  if (rawY == null) {
    rawY = oldY;
  }
  text("Y: " + rawY, 10,75);
  oldY = rawY;
  
  //Make the rawZ text
  fill(0,0,255);
  if (rawZ == null) {
    rawZ = oldZ;
  }
  text("Z: " + rawZ, 10,100);
  oldZ = rawZ;
  
  posX += 1;
  drawGraph(rawX,height-800,255,0,0,300,false);
  drawGraph(rawY,height-500,0,255,0,300,false);
  drawGraph(rawZ,height-200,0,0,255,380,true);
}

int posX = 0;

void drawGraph(String var,int posY,int r,int g,int b, int decrement, boolean hasNewline) {
  int num;
  
  if (var != null) {
    if (posX >= width) {
      posX = 0;
      background(255);
    }
    if (hasNewline) {
      String newVar = var.substring(0,3);
      num = Integer.valueOf(newVar);
    } else {
      num = int(split(var, ' '))[0];
    }
    stroke(r,g,b);
    line(posX,posY,posX,posY-num+decrement);
  }
}