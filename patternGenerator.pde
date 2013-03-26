
/**
parseSentence takes a String of text and generates a pattern.
INPUT : String sentence is an entire block of text including spaces and punctuation (e.g. "hello world!"). 
OUTPUT : 
**/
void parseSentence(String sentence) {
  String[] tokens = sentenceTokenizer(sentence);
  float avgHeight = avgLength(sentence);
  println("avgHeight: "+avgHeight);
  println("tokens: "+Arrays.toString(tokens));
}



/**
wordToColor takes a String containing a single word without punctuation or space and generates a color.
**/
color wordToColor(String word) {
  return color(0,0,0);
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
    if (token.length() >= 1 && "1234567890qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM".contains(token.substring(0, 1)) == true) {
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

**/















