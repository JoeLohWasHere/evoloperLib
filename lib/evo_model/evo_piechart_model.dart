import 'dart:developer';
import 'dart:convert';

//Zhi Qing
class EvoChartPieSeriesModel{
  final List<Series> heightList;

  EvoChartPieSeriesModel({this.heightList});

  String toJsonString(){
    String _listTranslated = '[', _end = ', ';

    for (int i=0; i<heightList.length; i++){
      if (heightList.length == i+1){
        _end = ']';
      }
      String jsonString = jsonEncode(heightList[i]);
      _listTranslated = _listTranslated + jsonString + _end;
    }
    return _listTranslated;
  }
}

class Series{
  final String name;
  final double value;

  Series({this.name,this.value});

  Map<String, dynamic> toJson(){
    return {
      "name": this.name,
      "value": this.value,
    };
  }
}

class Legend{
  final String name;
  final String value;

  Legend({this.value,this.name});


  @override
  String toString() {
    return '"$name" : "$value"';
  }
}

class EvoChartPieLegendModel{
  final List<Legend> legendList;

  EvoChartPieLegendModel({this.legendList});

  String toJsonString(){
    String _listTranslated = '[{', _end = '}]';

    String jsonString = legendList.join(",");

    _listTranslated = _listTranslated + jsonString + _end;
    return _listTranslated;
  }

}
