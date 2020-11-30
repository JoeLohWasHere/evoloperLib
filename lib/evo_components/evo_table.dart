import 'package:flutter/material.dart';

class EvoTable{
  final Color titleRowColor, titleFontColor, oddBarColor;
  final List<String> titleList;
  final List<List<String>> rowMatrixList;

  EvoTable({this.titleRowColor, this.titleFontColor, this.oddBarColor, this.titleList, this.rowMatrixList});

  List<TableRow> _tableRowList = [];

  void _buildTitleRow(){
    _tableRowList.clear();

    EdgeInsets _titleEdgeInsets = const EdgeInsets.fromLTRB(5, 8, 5, 8);

    List<Padding> _columnList = [];

    titleList.forEach((_columnTitle) {
      _columnList.add(
        Padding(
          padding: _titleEdgeInsets,
          child: Center(child: Text(_columnTitle, style: TextStyle(color: titleFontColor, fontWeight: FontWeight.w800),)),
        ),
      );
    });

    _tableRowList.add(
      TableRow(
          decoration:
          BoxDecoration(
            color: titleRowColor,
            borderRadius: new BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
          ),
          children: _columnList
      ),
    );
  }

  // Widget _rowFormat(){
  //   EdgeInsets _dataEdgeInsets = const EdgeInsets.fromLTRB(8, 5, 8, 5);
  //
  //   return Padding(
  //     padding: _dataEdgeInsets,
  //     child: Center(child: Text(style: TextStyle(fontWeight: FontWeight.w600)),
  //   );
  // }

  List<TableRow> _buildRows(){
    try{
      _buildTitleRow();

      bool _darkLine = false;
      String _firstVarValue = '';
      String _secondVarValue = '';

      rowMatrixList.forEach((_rowList) {
        _tableRowList.add(
            TableRow(
                decoration: BoxDecoration(
                  color: _darkLine?Colors.transparent:oddBarColor??Colors.black.withOpacity(0.4),
                ),
                children: [
                ]));

        _darkLine = !_darkLine;
      });
    }catch(e){}

    return _tableRowList;
  }
}