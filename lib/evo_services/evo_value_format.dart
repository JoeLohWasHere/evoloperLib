class EvoValueFormat{
  String getCommaSeparatorString(dynamic stringValue){
    RegExp _finder = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    Function _mathFunc = (Match match) => '${match[1]},';
    return stringValue.toString().replaceAllMapped(_finder, _mathFunc).toString();
  }

  Map getPercentagesMap(Map mapValue){
    double _total = 0;
    Map _keeper = {};

    mapValue.forEach((_name,_value) =>  _total = _total + _value);

    mapValue.forEach((_name,_value) {
      String _newName = _name.replaceAll('"', "'");
      _keeper[_newName] = ((_value/_total)*100);
    });

    return _keeper;
  }
}