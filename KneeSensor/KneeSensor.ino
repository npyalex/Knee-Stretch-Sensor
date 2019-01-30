/*
  By Nick Alexander for Body-Centric Technologies OCADU 2019
  For tracking range-of-motion using a stretch sensor on a wearable
  combined with Processing
  Based on AnalogReadSerial from Arduino
*/

// the setup routine runs once when you press reset:
void setup() {
  // initialize serial communication at 9600 bits per second:
  Serial.begin(9600);
}

// the loop routine runs over and over again forever:
void loop() {
  // read the input on analog pin 0:
  int sensorValue = analogRead(A0);
  int mappedValue = map(sensorValue,0,1022,100,5000);
  // print out the value you read:
  Serial.print(sensorValue);
  Serial.print(',');
  Serial.print(mappedValue);
  Serial.println(',');
  delay(200);        // delay in between reads for stability
}
