class EvoStringFormat{
  String removeWhitespaceSymbols(String str) {
    if (str.endsWith(" ")) {str = str.substring(0, str.length - 1);}
    if (str.endsWith(",")) {str = str.substring(0, str.length - 1);}
    if (str.endsWith(".")) {str = str.substring(0, str.length - 1);}

    return str;
  }
}