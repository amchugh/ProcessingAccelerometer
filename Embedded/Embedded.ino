int testNum = 0;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
}

void loop() {
  // Increment the test number, as we are starting a new test
  testNum += 1;
  
  // Read the pins A0 - A2
  int rawX = analogRead(A0);
  int rawY = analogRead(A1);
  int rawZ = analogRead(A2);
  
  // Define variables and scale them to G's
  float scaledX, scaledY, scaledZ;
  scaledX = mapf(rawX, 0, 675, -3, 3);
  scaledY = mapf(rawY, 0, 675, -3, 3);
  scaledZ = mapf(rawY, 0, 675, -3, 3);
  
  // Print the data
  /*
  Serial.println("Test Number : " + (String)testNum);
  Serial.println("X: " + (String)rawX + " ; X: " + (String)scaledX + " g");
  Serial.println("Y: " + (String)rawY + " ; Y: " + (String)scaledY + " g");
  Serial.println("Z: " + (String)rawZ + " ; Z: " + (String)scaledZ + " g");
  */
  
  // Print the data
  Serial.print(testNum); Serial.print(" ");
  Serial.print(rawX); Serial.print(" ");
  Serial.print(rawY); Serial.print(" ");
  Serial.println(rawZ);
  
  // Wait
  delay(50);
}

float mapf(float x, float in_min, float in_max, float out_min, float out_max)
{
  return (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;
}
