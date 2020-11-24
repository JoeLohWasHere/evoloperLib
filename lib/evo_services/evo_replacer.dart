class EvoReplacer{
  final String data, before, after;

  EvoReplacer({this.data, this.before, this.after});

  String getString(){
    Function _replace = (Match match) => after.toString();
    return data.toString().replaceAllMapped(before, _replace).toString();
  }
}

class EvoAdvancedReplacer{
  final String data, newValue;
  final RegExp full, front;

  EvoAdvancedReplacer({this.data, this.newValue, this.full, this.front});

  String getString(){
    String _strFull = front.firstMatch(data).group(0);
    String _strFront = front.firstMatch(data).group(0).toString();
    Function _replacer = (Match match) => _strFront+newValue;

    return data.replaceAllMapped(_strFull, _replacer);
  }
}