class EvoStringFormat{
  String removeWhitespaceSymbols(String str) {
    if (str.endsWith(" ")) {str = str.substring(0, str.length - 1);}
    if (str.endsWith(",")) {str = str.substring(0, str.length - 1);}
    if (str.endsWith(".")) {str = str.substring(0, str.length - 1);}

    return str;
  }

  String getStringFromList(List input){
    String _listTranslated = '["', _end = '","';

    for (int i=0; i<input.length; i++){
      if (input.length == i+1){
        _end = '"]';
      }

      _listTranslated = _listTranslated + input[i].toString() + _end;
    }

    return _listTranslated;
  }
}