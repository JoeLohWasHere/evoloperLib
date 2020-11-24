class MapListFormat{
  final Map<dynamic, dynamic> inputMap;
  final List<dynamic> inputTitleList, inputContentList;
  final Function inputFunction;
  List outputTitleList=[], outputContentList=[];
  Map outputMap={};

  MapListFormat({this.inputMap, this.inputTitleList, this.inputContentList, this.inputFunction});

  void getListFromMap(){
    inputMap.forEach((_title, _content){
      outputTitleList.add(_title);
      outputContentList.add(_content);

      try{
        inputFunction();
      }catch(e){}
    });
  }

  void getMapFromLists(){
    void _printError(){
      print('Lists do not match');
    }

    if(inputTitleList.isNotEmpty||inputContentList.isNotEmpty){
      if(inputTitleList.length==inputContentList.length){
        for(int i=0; i<inputTitleList.length; i++){
          outputMap[inputTitleList[i]] = inputContentList[i];
        }
      }else{_printError();}
    }else{_printError();}
  }
}