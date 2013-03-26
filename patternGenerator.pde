
/**
parseSentence takes a String of text and generates a pattern.
INPUT : String sentence is an entire block of text including spaces and punctuation (e.g. "hello world!"). 
OUTPUT : PGraphics of the textblock without repeating.
**/
PGraphics parseSentence(String sentence) {
  String[] tokens = sentenceTokenizer(sentence);
  int avgHeight = round(avgLength(sentence));
  println("avgHeight: "+avgHeight);
  println("tokens: "+Arrays.toString(tokens));
  if (avgHeight >= 1.0 && sentence.length() >= 1.0) {
    PGraphics pg = createGraphics(sentence.length(), avgHeight);
    drawPattern(pg, tokens, avgHeight);
    return pg;
  } else {
    PGraphics pg = createGraphics(10, 10);
    pg.beginDraw();
    pg.endDraw();
    return pg;
  }
}



/**
wordToColor takes a String containing a single word without punctuation or space and generates a color.
**/
color wordToColor(String word) {
  word = word.toLowerCase();  // makes all of the letters lower case
  if (isWord(word) == true) {
    float h = 0;
    float s = 100;
    float b = 100;
   
    /* get the average of all the hues by adding every third character and dividing by the total */
    float allHue = 0;
    float numOfHue = 0;
    for (int i = 0; i < word.length(); i += 3) {
      char thisChar = word.charAt(i);
      float thisHue = charToHue(thisChar);
      allHue += thisHue;
      numOfHue += 1;
      h = allHue / numOfHue;
    }
    
    /* get the average of all the saturations by adding every third character and dividing by the total */
    float allSat = 0;
    float numOfSat = 0;
    for (int i = 1; i < word.length(); i += 3) {
      char thisChar = word.charAt(i);
      float thisSat = charToSat(thisChar);
      allSat += thisSat;
      numOfSat += 1;
      s = allSat / numOfSat;
    }
    
    /* get the average of all the values (or blacknesses) by adding every third character and dividing by the total */
    float allVal = 0;
    float numOfVal = 0;
    for (int i = 2; i < word.length(); i += 3) {
      char thisChar = word.charAt(i);
      float thisVal = charToVal(thisChar);
      allVal += thisVal;
      numOfVal += 1;
      b = allVal / numOfVal;
    }
    
    return color(h, s, b);
  } else {
    return color(0, 0, 100); // white
  }
  
}



/**
charToNum takes a char and returns what number it is assigned to
INPUT : char
OUTPUT : int
**/
int charToNum(char input) {
  if (input >= '0' && input <= '9') {  // if a character is a number
    return 0;
  } else if (input >= 'a' && input <= 'z') { // if a character is a letter
    return input - 'a' + 1;
  } else {
    return 0;
  }
}




/**
charToHue takes a char and returns the hue
INPUT: char
OUTPUT: float
**/
float charToHue(char input) {
  int i = charToNum(input);
  return ( i / 27.0 * 360.0 );
}



/**
charToSat takes a char and returns the saturation
INPUT: char
OUTPUT: float
**/
float charToSat(char input) {
  int i = charToNum(input);
  return ( i / 26.0 * 100.0 );
}



/**
charToVal takes a char and retursn the value
INPUT: char
OUTPUT: float
**/
float charToVal(char input) {
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
    pg.fill(wordToColor(token));
    pg.noStroke();
    pg.rect(pgX, 0, token.length(), avgHeight);
    pgX += token.length();
  }
  pg.endDraw();
}














