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
  println("PGraphics: "+unit);
  image(unit, 0, 0);
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


