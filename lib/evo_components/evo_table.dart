import 'package:flutter/material.dart';

class EvoTable{
  final Color titleRowColor, titleFontColor, oddBarColor;
  final List<String> titleList;

  EvoTable({this.titleRowColor, this.titleFontColor, this.oddBarColor, this.titleList});

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

  List<TableRow> getTable(){
    try{
      _buildTitleRow();

      EdgeInsets _dataEdgeInsets = const EdgeInsets.fromLTRB(8, 5, 8, 5);

      bool _darkLine = false;
      String _firstVarValue = '';
      String _secondVarValue = '';

      // _rawDataListModel.rawDataModelList.forEach((_row) {
      //   switch(this.widget.pageIndex){
      //     case 0:
      //       _firstVarValue = _row.itemCode;
      //       _secondVarValue = _row.itemDesc;
      //       break;
      //     case 1:
      //       _firstVarValue = _row.name;
      //       _secondVarValue = _row.locDesc;
      //       break;
      //     case 2:
      //       _firstVarValue = _row.name;
      //       _secondVarValue = _row.shortName;
      //   }
      //
      //   _tableRowList.add(
      //       TableRow(
      //           decoration: BoxDecoration(
      //             color: _darkLine?Colors.transparent:oddBarColor??Colors.black.withOpacity(0.4),
      //           ),
      //           children: [
      //             Padding(
      //               padding: _dataEdgeInsets,
      //               child: Center(child: Text(_firstVarValue, style: TextStyle(color: ColorThemes.fontColor, fontWeight: FontWeight.w600),)),
      //             ),
      //             Padding(
      //               padding: _dataEdgeInsets,
      //               child: Center(child: Text(_secondVarValue, style: TextStyle(color: ColorThemes.fontColor, fontWeight: FontWeight.w600),)),
      //             ),
      //             Padding(
      //               padding: _dataEdgeInsets,
      //               child: Align(alignment: Alignment.centerRight, child: Text(_row.orderQty.toStringAsFixed(0), style: TextStyle(color: ColorThemes.fontColor, fontWeight: FontWeight.w600),)),
      //             ),
      //             Padding(
      //               padding: _dataEdgeInsets,
      //               child: Align(alignment: Alignment.centerRight, child: Text(_row.netAmtExc.toStringAsFixed(2), style: TextStyle(color: ColorThemes.fontColor, fontWeight: FontWeight.w600),)),
      //             ),
      //           ]));
      //
      //   _darkLine = !_darkLine;
      // });
    }catch(e){}

    return _tableRowList;
  }
}