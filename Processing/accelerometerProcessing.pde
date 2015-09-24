import processing.serial.*;

Serial myPort;  // Create object from Serial class
String val;     // Data received from the serial port

void setup() {
  size(600,400);
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 115200);
  background(255); //Clear the background
}

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
  
  if (testNum != null) {
    text("Test Number: " + testNum, 0,25);
  } else {
    text("null", 0,25);
  }
  
  //Make the rawX text
  fill(255,0,0);
  if (rawX != null) {
    text("X: " + rawX, 10,50);
  }
  
  //Make the rawY text
  fill(0,255,0);
  if (rawY != null) {
    text("Y: " + rawY, 10,75);
  }
  
  //Make the rawZ text
  fill(0,0,255);
  if (rawZ != null) {
    text("Z: " + rawZ, 10,100);
  } 
}