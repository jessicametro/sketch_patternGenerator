/* IMPORTS */

/* @pjs font="Roboto-Thin.ttf"; */



/* VARIABLES */

String line1 = "Begin typing to generate a pattern.";
String line2 = "Try words, sentences, and even paragraphs.";
String line3 = "You can save it when you’re done!";

String sentence = "";

String allowedChar = "1234567890qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM!&?.,;:'\" ";



/* SETUP */

void setup() {
  size(840, 500);
  colorMode(HSB, 360, 100, 100);
  noLoop();
  fontRoboto = createFont("Roboto-Thin.ttf", 38);
  textFont(fontRoboto);
  textAlign(CENTER);
}



/* DRAW */

void draw() {
  colorMode(HSB, 360, 100, 100);
  background(0, 0, 100);
  if (sentence.length() == 0) {
    fill(0, 0, 0);
    text(line1, 420, 70);
    text(line2, 420, 120);
    text(line3, 420, 170);
  } else {
	  PGraphics unit = parseSentence(sentence);
	  boolean keepGoing = true;
	  for (int i = 0; keepGoing; i += 1) {
		int x = ( unit.width * i ) % width;  // x position is the unit's width until it reaches the end of the sketch
		int y = (int)(int( unit.width * i ) / (int)(width)) * unit.height;  // y position is the current row times the height of the unit
		/* println("y is: "+y); */
		if (x < unit.width) {
		  image(unit, x-unit.width, y);
		}
		if (y > height) {
		  keepGoing = false;
		}
		image(unit, x, y);
	  }
   }
}



/* KEYPRESSED */

void keyPressed() {
  println("keypressed is "+key);
  if (key == BACKSPACE) {
    if (sentence.length() > 0) {
      sentence = sentence.substring(0, sentence.length()-1);
    }
  } else if (allowedChar.contains(key+"")) {  // adding an empty string turns a char into a String
    sentence = sentence+key;
    println("the sentence is:" +sentence);
  }
  redraw();
}

void setSentence(String newSentence) {
	sentence = newSentence;
	redraw();
}

/* SAVE PATTERN */

void savePattern() {
  saveFrame();
}



/* UPLOAD IMAGE */

void uploadImage() {
  upload($p, 'upload/upload.php');
  println("uploading the image now");
}



/* SAVE AND UPLOAD IMAGE */

void saveAndUpload() {
	savePattern();
	uploadImage();
}



/* VARIABLES */

int s = 4;   // s = scale



/**
parseSentence takes a String of text and generates a pattern.
INPUT : String sentence is an entire block of text including spaces and punctuation (e.g. "hello world!"). 
OUTPUT : PGraphics of the textblock without repeating.
**/
PGraphics parseSentence(String sentence) {
  String[] tokens = sentenceTokenizer(sentence);
  int avgHeight = round(avgLength(sentence));
  println("avgHeight: "+avgHeight);
  //println("tokens: "+Arrays.toString(tokens));
  if (avgHeight >= 1.0 && sentence.length() >= 1.0) {
    PGraphics pg = createGraphics(sentence.length()*s, avgHeight*s);
    drawPattern(pg, tokens, avgHeight);
    return pg;
  } else {
    PGraphics pg = createGraphics(100, 100);
    pg.beginDraw();
    pg.endDraw();
    return pg;
  }
}



/**
wordToColor takes a String containing a single word without punctuation or space and generates a color.
**/
color wordToColor(String word, PGraphics pg) {
  word = word.toLowerCase();  // makes all of the letters lower case
  if (isWord(word) == true) {
    float h = 0;
    float s = 100;
    float b = 100;
   
    /* get the average of all the hues by adding every third character and dividing by the total */
    float allHue = 0;
    float numOfHue = 0;
    for (int i = 0; i < word.length(); i += 3) {
      int thisChar = word.charCodeAt(i);
      float thisHue = charToHue(thisChar);
      allHue += thisHue;
      numOfHue += 1;
      h = allHue / numOfHue;
    }
    
    /* get the average of all the saturations by adding every third character and dividing by the total */
    float allSat = 0;
    float numOfSat = 0;
    for (int i = 1; i < word.length(); i += 3) {
      int thisChar = word.charCodeAt(i);
      float thisSat = charToSat(thisChar);
      allSat += thisSat;
      numOfSat += 1;
      s = allSat / numOfSat;
    }
    
    /* get the average of all the values (or blacknesses) by adding every third character and dividing by the total */
    float allVal = 0;
    float numOfVal = 0;
    for (int i = 2; i < word.length(); i += 3) {
      int thisChar = word.charCodeAt(i);
      float thisVal = charToVal(thisChar);
      allVal += thisVal;
      numOfVal += 1;
      b = allVal / numOfVal;
    }
    println("color: h:"+h+" s:"+s+" b:"+b);
    return pg.color(h, s, b);
  } else {
    return pg.color(0, 0, 100); // white
  }
  
}



/**
charToNum takes a char and returns what number it is assigned to
INPUT : char
OUTPUT : int
**/
int charToNum(int input) {
  if (input >= "0".charCodeAt(0) && input <= "9".charCodeAt(0)) {  // if a character is a number
    return 0;
  } else if (input >= "a".charCodeAt(0) && input <= "z".charCodeAt(0)) { // if a character is a letter
    return input - "a".charCodeAt(0) + 1;
  } else {
    return 0;
  }
}




/**
charToHue takes a char and returns the hue
INPUT: char
OUTPUT: float
**/
float charToHue(int input) {
  int i = charToNum(input);
  return ( i / 27.0 * 360.0 );
}



/**
charToSat takes a char and returns the saturation
INPUT: char
OUTPUT: float
**/
float charToSat(int input) {
  int i = charToNum(input);
  return ( i / 26.0 * 100.0 );
}



/**
charToVal takes a char and retursn the value
INPUT: char
OUTPUT: float
**/
float charToVal(int input) {
  int i = charToNum(input);
  return ( i / 26.0 * 100.0 );
}



/**
isWord takes a String (token) and determines whether it is a word or not (i.e. space, punctuation, etc).
**/
boolean isWord(String token) {
  if (token.length() >= 1 && "1234567890qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM".contains(token.substring(0, 1)) == true) {
    return true;
  } else {
    return false; 
  }
}



/**
avgLength is the average length of all of the words in a String.
**/
float avgLength(String sentence) {
  float numOfWords = 0;
  float wordsLength = 0;
  String[] tokens = sentenceTokenizer(sentence);
  for (int i = 0; i < tokens.length; i += 1) {        // tokens is an Array
    String token = tokens[i];                         // token is a String
    if (isWord(token)) {
      numOfWords += 1;
      wordsLength += token.length();
    } 
  }
  println(wordsLength + "/" + numOfWords + "=" + (wordsLength / numOfWords));
  return wordsLength / numOfWords;
}



/**
The String "hello world! my" becomes an array of Strings {"hello", "_", "world", "!", "_", "my"}.
**/
String[] sentenceTokenizer(String sentence) {
  return sentence.split("\\b");
}



/**
drawPattern 
**/
void drawPattern(PGraphics pg, String[] tokens, int avgHeight) {
  pg.beginDraw();
  pg.colorMode(HSB, 360, 100, 100);
  int pgX = 0;
  for (int i = 0; i < tokens.length; i += 1) {
    String token = tokens[i];
    pg.fill(wordToColor(token, pg));
    pg.noStroke();
    pg.rect(pgX*s, 0, token.length()*s, avgHeight*s);
    pgX += token.length();
  }
  pg.endDraw();
}




