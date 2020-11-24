import 'package:evo_lib/evo_components/evo_back_manager.dart';
import 'package:flutter/material.dart';

class CustomDialog{
  final dynamic context;
  final String title, content;
  final List<Widget> buttons;
  final List<String> contentList, boxContentList;
  final Map<String, String> boxContentTitleMap;

  CustomDialog({this.context, this.title, this.content, this.contentList, this.boxContentList, this.boxContentTitleMap, this.buttons});

  bool _noContent(){
    switch(content){
      case null:
        return true;
        break;
      default:
        return false;
    }
  }

  bool _noContentList(){
    try{
      if(contentList.length < 1){
        return true;
      } else {
        return false;
      }
    }catch(e){
      return true;
    }
  }

  bool _noBoxContentList(){
    try{
      if(boxContentList.length < 1){
        return true;
      } else {
        return false;
      }
    }catch(e){
      return true;
    }
  }

  bool _noBoxContentTitleMap(){
    try{
      if(boxContentTitleMap.length < 1){
        return true;
      } else {
        return false;
      }
    }catch(e){
      return true;
    }
  }

  Widget _content(message){
    return Text(
      content,
      style: TextStyle(
        //                fontWeight: FontWeight.bold
        //   color: ColorThemes.fontColor
      ),
    );
  }

  Widget _boxContent(message){
    return Container(
      decoration: BoxDecoration(
          borderRadius: new BorderRadius.circular(7),
          // border: Border.all(color: ColorThemes.fontColor)
      ),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Text(
          message,
          style: TextStyle(
              // color: ColorThemes.fontColor,
              fontSize: 13
          ),
        ),
      ),
    );
  }

  Widget _boxContentTitle(title, message){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$title: ',
          style: TextStyle(
              // color: ColorThemes.fontColor,
              fontSize: 13
          ),
        ),
        SizedBox(height: 5,),
        Container(
          width: MediaQuery.of(context).size.width - 100,
          decoration: BoxDecoration(
              borderRadius: new BorderRadius.circular(7),
              // border: Border.all(color: ColorThemes.fontColor)
          ),
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Text(
              message,
              style: TextStyle(
                  // color: ColorThemes.fontColor,
                  fontSize: 13
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> _contentBuilder(){
    List<Widget> _allContents = [];

    _allContents.add(Divider(
        // color: ColorThemes.fontColor.withOpacity(0.5))
    ));

    switch(_noContent()){
      case false:
        _allContents.add(SizedBox(height: 15,));
        _allContents.add(_content(content));
    }

    switch(_noContentList()){
      case false:
        contentList.forEach((message){
          if(message.length>0){
            _allContents.add(SizedBox(height: 15,));
            _allContents.add(_content(message));
          }
        });
    }

    switch(_noBoxContentList()){
      case false:
        boxContentList.forEach((message){
          try{
            if(message.length>0){
              _allContents.add(SizedBox(height: 15,));
              _allContents.add(_boxContent(message));
            }
          }catch(e){}
        });
    }

    switch(_noBoxContentTitleMap()){
      case false:
        boxContentTitleMap.forEach((title, message){
          try{
            if(message.length>0){
              _allContents.add(SizedBox(height: 15,));
              _allContents.add(_boxContentTitle(title, message));
            }
          }catch(e){}
        });
    }

    return _allContents;
  }

  void show(){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return EvoBackManager(
          child: Theme(
            // data: ThemeData(dialogBackgroundColor: ColorThemes.bgColor.withOpacity(0.6)),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: AlertDialog(
                title: new Text(
                  title,
                  style: TextStyle(
                      // color: ColorThemes.barAccent,
                      fontWeight: FontWeight.bold
                  ),
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: _contentBuilder(),
                ),
                actions: buttons,
                shape: RoundedRectangleBorder(
                    borderRadius:BorderRadius.all(Radius.circular(20))
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget closeButton(text){
    return FlatButton(
        child: new Text(text),
        onPressed: () => Navigator.of(context).pop()
    );
  }

  Widget customButton(text, function){
    return FlatButton(
        child: new Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () => function()
    );
  }
}