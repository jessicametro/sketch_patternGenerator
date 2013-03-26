/* IMPORTS */

import java.util.Arrays;



/* VARIABLES */

PFont fontRoboto;
String sentence = "";

String allowedChar = "1234567890qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM!&?.,;:'\" ";



/* SETUP */

void setup() {
  size(100, 100);
  colorMode(HSB, 360, 100, 100);
  noLoop();
  fontRoboto = loadFont("Roboto-Thin-12.vlw");
  textFont(fontRoboto);
  textAlign(CENTER);
}



/* DRAW */

void draw() {
  background(0, 0, 100);
  PGraphics unit = parseSentence(sentence);
  boolean keepGoing = true;
  for (int i = 0; keepGoing; i += 1) {
    int x = ( unit.width * i ) % width;  // x position is the unit's width until it reaches the end of the sketch
    int y = ( unit.width * i ) / width * unit.height;  // y position is the current row times the height of the unit
    if (x < unit.width) {
      image(unit, x-unit.width, y);
    }
    if (y > height) {
      keepGoing = false;
    }
    image(unit, x, y);
  }
  fill(0);
  text(sentence, 50, 50);
}



/*  */

void keyPressed() {
  if (key == BACKSPACE) {
    if (sentence.length() > 0) {
      sentence = sentence.substring(0, sentence.length()-1);
    }
  } else if (allowedChar.contains(key+"")) {  // adding an empty string turns a char into a String
    sentence = sentence+key;
  }
  redraw();
}


