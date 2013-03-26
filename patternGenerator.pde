
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
    return createGraphics(10, 10);
  }
}



/**
wordToColor takes a String containing a single word without punctuation or space and generates a color.
**/
color wordToColor(String word) {
  if (isWord(word) == true) {
    return color(0,0,0);
  } else {
    return color(255,255,255);
  }
  
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














