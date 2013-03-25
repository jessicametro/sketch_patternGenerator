/* VARIABLES */

PFont fontRoboto;
String sentence = "";

//float hue! = ( 0 / 27 * 360 );
float hueA = ( 1 / 27 * 360 );
float hueB = ( 2 / 27 * 360 );
float hueC = ( 3 / 27 * 360 );
float hueD = ( 4 / 27 * 360 );
float hueE = ( 5 / 27 * 360 );
float hueF = ( 6 / 27 * 360 );
float hueG = ( 7 / 27 * 360 );
float hueH = ( 8 / 27 * 360 );
float hueI = ( 9 / 27 * 360 );
float hueJ = ( 10 / 27 * 360 );
float hueK = ( 11 / 27 * 360 );
float hueL = ( 12 / 27 * 360 );
float hueM = ( 13 / 27 * 360 );
float hueN = ( 14 / 27 * 360 );
float hueO = ( 15 / 27 * 360 );
float hueP = ( 16 / 27 * 360 );
float hueQ = ( 17 / 27 * 360 );
float hueR = ( 18 / 27 * 360 );
float hueS = ( 19 / 27 * 360 );
float hueT = ( 20 / 27 * 360 );
float hueU = ( 21 / 27 * 360 );
float hueV = ( 22 / 27 * 360 );
float hueW = ( 23 / 27 * 360 );
float hueX = ( 24 / 27 * 360 );
float hueY = ( 25 / 27 * 360 );
float hueZ = ( 26 / 27 * 360 );

//float sv# = ( 0 / 26 * 100 );
float svA = ( 1 / 26 * 100 );
float svB = ( 2 / 26 * 100 );
float svC = ( 3 / 26 * 100 );
float svD = ( 4 / 26 * 100 );
float svE = ( 5 / 26 * 100 );
float svF = ( 6 / 26 * 100 );
float svG = ( 7 / 26 * 100 );
float svH = ( 8 / 26 * 100 );
float svI = ( 9 / 26 * 100 );
float svJ = ( 10 / 26 * 100 );
float svK = ( 11 / 26 * 100 );
float svL = ( 12 / 26 * 100 );
float svM = ( 13 / 26 * 100 );
float svN = ( 14 / 26 * 100 );
float svO = ( 15 / 26 * 100 );
float svP = ( 16 / 26 * 100 );
float svQ = ( 17 / 26 * 100 );
float svR = ( 18 / 26 * 100 );
float svS = ( 19 / 26 * 100 );
float svT = ( 20 / 26 * 100 );
float svU = ( 21 / 26 * 100 );
float svV = ( 22 / 26 * 100 );
float svW = ( 23 / 26 * 100 );
float svX = ( 24 / 26 * 100 );
float svY = ( 25 / 26 * 100 );
float svZ = ( 26 / 26 * 100 );

String allowedChar = "1234567890qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM!&?.,;:'\" ";


/* SETUP */

void setup() {
  size(100, 100);
  fontRoboto = loadFont("Roboto-Thin-12.vlw");
  textFont(fontRoboto);
  textAlign(CENTER);
}



/* DRAW */

void draw() {
  background(255);
  noStroke();
  fill(0);
  rect(0, 0, 5, 2);
  fill(0);
  text(sentence, 50, 50);
}



/* */

void keyPressed() {
  if (key == BACKSPACE) {
    if (sentence.length() > 0) {
      sentence = sentence.substring(0, sentence.length()-1);
    }
  } else if (allowedChar.contains(key+"")) {  // adding an empty string turns a char into a String
    sentence = sentence+key;
  }
}


