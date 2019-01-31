import processing.serial.*; // import the Processing serial library
Serial myPort;              // The serial port
int fillColour1 = 51;
int fillColour2 = 255;
int fillColour3 = 51;
int rectWidth;
int sensorValue;
int mappedValue;

void setup() {
  size(1000, 800);
  // List all the available serial ports in the console
 printArray(Serial.list()); // uncomment this to view your port Amaria

  // Change the 0 to the appropriate number of the serial port
  // that your microcontroller is attached to.
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
  // read incoming bytes to a buffer
  // until you get a linefeed (ASCII 10):
  myPort.bufferUntil('\n');
}

void draw(){
  background (0);
  rectMode(CENTER);
  stroke(fillColour1, fillColour2, fillColour3);
  strokeWeight(10);
  fill(fillColour1, fillColour2, fillColour3);
/*  noFill();
  beginShape();
  curveVertex(100, height/2);
  curveVertex(width*0.25, rectWidth);
  curveVertex(width/2, rectWidth);
  curveVertex(width*0.75, rectWidth);
  curveVertex(500, height/2);
  endShape(); */
  rect(width/2, height*0.25, rectWidth, 30);
  noFill();
//  curve(width/2, -rectWidth, 100, height/2, 900, height/2, width/2, -rectWidth);
  rectWidth = mappedValue;
  dangerZone();
}

void serialEvent(Serial myPort) {
  // read the serial buffer:
  String myString = myPort.readStringUntil('\n');
  if (myString != null) {
    println(myString);
    int sensor[] = int(split(myString,','));
    sensorValue = sensor[0];
    mappedValue = sensor[1];
  }
}

void dangerZone(){
  if (sensorValue <= 85) {
    fillColour1 = 51;
    fillColour2 = 255;
    fillColour3 = 51;
  }
  if (sensorValue >= 85 && sensorValue <= 100) {
    fillColour1 = 255;
    fillColour2 = 255;
    fillColour3 = 51;
  }
  if (sensorValue > 100) {
    fillColour1 = 255;
    fillColour2 = 0;
    fillColour3 = 0;
  }
}
