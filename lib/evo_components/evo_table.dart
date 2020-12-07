import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EvoTable extends StatelessWidget{
  final Color titleRowColor, titleFontColor, oddBarColor, contentColor;
  final List<String> titleList;
  final List<List<String>> rowsList;

  EvoTable({this.titleRowColor, this.titleFontColor, this.oddBarColor, this.contentColor, this.titleList, this.rowsList});

  List<TableRow> _tableRowList = [];

  void _buildTitleRow(){
    EdgeInsets _titleEdgeInsets = const EdgeInsets.fromLTRB(5, 8, 5, 8);

    List<Padding> _columnList = [];

    titleList.forEach((_columnTitle) {
      _columnList.add(
        Padding(
          padding: _titleEdgeInsets,
          child: Center(child: Text(_columnTitle, style: TextStyle(color: titleFontColor??Colors.white, fontWeight: FontWeight.w800),)),
        ),
      );
    });

    _tableRowList.add(
      TableRow(
          decoration:
          BoxDecoration(
            color: titleRowColor??Colors.black,
            borderRadius: new BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
          ),
          children: _columnList
      ),
    );
  }

  Widget _rowFormat(dynamic value){
    EdgeInsets _dataEdgeInsets = const EdgeInsets.fromLTRB(8, 5, 8, 5);

    return Padding(
      padding: _dataEdgeInsets,
      child: Center(
          child: Text(value,
              style: TextStyle(
                  color: contentColor??Colors.grey,
                  fontWeight: FontWeight.w600
              )
      )),
    );
  }

  List<TableRow> _buildRows(){
    try{
      _tableRowList.clear();
      _tableRowList.clear();

      _buildTitleRow();

      bool _darkLine = false;

      rowsList.forEach((_rowList) {
        List<Widget> _rows = [];

        _rowList.forEach((_value) {
          _rows.add(_rowFormat(_value));
        });

        _tableRowList.add(
            TableRow(
                decoration: BoxDecoration(
                  color: _darkLine?Colors.transparent:oddBarColor??Colors.black.withOpacity(0.5),
                ),
                children: _rows
            )
        );

        _darkLine = !_darkLine;
      });
    }catch(e){}

    return _tableRowList;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
      child: Table(
        border: TableBorder(
            horizontalInside: BorderSide(width: 1, color: Colors.grey.withOpacity(0.3), style: BorderStyle.solid),
            verticalInside: BorderSide(width: 1, color: Colors.white.withOpacity(0.5), style: BorderStyle.solid),
            bottom: BorderSide(width: 1, color: Colors.white.withOpacity(0.5))
        ),
        children: _buildRows(),
      ),
    );
  }
}