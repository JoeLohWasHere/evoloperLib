import 'package:evo_lib/evo_components/evo_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_echarts/flutter_echarts.dart';

class _EvoPieChartStructure{
  String name, radius, series, _quoter;
  bool outer = false;

  _EvoPieChartStructure({this.name, this.radius, this.series});

  String drawChart(){
    radius.length > 4 ? _quoter = '$radius' : _quoter = '"$radius"';

    return '''
            ,
             {
                "name": "$name",
                "type": "pie",
                radius: $_quoter,
                center: ['50%', '34%'],
                labelLine: {
                    normal: {
                    show: false
                  }
                },
                label: {
                   normal: {
                   show: false,
                   position: 'center'
                  },
                },
                "data": $series
             }
      ''';
  }
}

class EvoSimplePieChartTemplate extends StatelessWidget {
  final String title, subtitle, category, series, legend;

  EvoSimplePieChartTemplate({this.title, this.subtitle, this.category, this.series, this.legend});

  @override
  Widget build(BuildContext context) {
    return Echarts(
        option: '''
                        {
                          title: {
                              text: '$title',
                              subtext: '$subtitle',
                              left: 'center'
                          },
                          tooltip: {
                              trigger: 'item',
                              formatter: '{a} <br/>{b} : {c} ({d}%)'
                          },
                          legend: {
                              type: 'scroll',
                              orient: 'vertical',
                              left: '10',
                              bottom: 0,
                              data: $legend,
                          },
                          series: [
                              ${_EvoPieChartStructure(
            name: category,
            radius: "60%",
            series: series
        ).drawChart()}
                          ]
                        }
                        '''
    );
  }
}

// ignore: must_be_immutable
class EvoPieChartTemplate extends StatelessWidget {
  final bool isDark;
  final String
  legend,
      series1, series2, series3,
      legendValue,
      legendPercent,
      legendNamePadding,
      legendValuePadding,
      legendPercentPadding,
      legendNameMaxLength,
      title,
      fromDate, toDate,
      name1, name2, name3,
      color;

  final int chartLayer;

  String _outerChart, _radius1, _radius2, _color, _legendNamePadding, _legendValuePadding, _legendPercentPadding, _legendNameMaxLength;

  EvoPieChartTemplate({
    this.isDark,
    this.title,
    this.name1, this.name2, this.name3,
    this.series1, this.series2, this.series3,
    this.legend,
    this.legendValue,
    this.legendPercent,
    this.legendNamePadding,
    this.legendValuePadding,
    this.legendPercentPadding,
    this.legendNameMaxLength,
    this.fromDate, this.toDate,
    this.color,
    this.chartLayer
  });

  void _getOuterChart(){
    _drawChart2(_radius){
      return _EvoPieChartStructure(
        name: name2,
        radius: _radius,
        series: series2,
      ).drawChart();
    }

    _drawChart3(){
      return _EvoPieChartStructure(
        name: name3,
        radius: "['65%','80%']",
        series: series3,
      ).drawChart();
    }

    if (chartLayer == 1){
      _radius1 = "40%";
      _radius2 = "['55%', '80%']";
      _outerChart = _drawChart2(_radius2);
    } else if (chartLayer == 2){
      _radius1 = "30%";
      _radius2 = "['40%', '55%']";
      _outerChart = _drawChart2(_radius2) + _drawChart3();
    } else {
      _outerChart = "";
      _radius1 = "80%";
    }

    _legendNamePadding = legendNamePadding ?? '22';
    _legendValuePadding = legendValuePadding ?? '11';
    _legendPercentPadding = legendPercentPadding ?? '7';
    _legendNameMaxLength = legendNameMaxLength ?? '22';

//    _legendNamePadding = legendNamePadding ?? '25';
//    _legendValuePadding = legendValuePadding ?? '14';
//    _legendPercentPadding = legendPercentPadding ?? '10';
//    _legendNameMaxLength = legendNameMaxLength ?? '23';
  }

  @override
  Widget build(BuildContext context) {
    EvoColor _evoColor = new EvoColor(isDark: isDark);

    this.color == null ? _color = _evoColor.getChartColors[0] : _color = this.color;
    _getOuterChart();
    //dark mode
    return Echarts(
        option: '''
                        {
                          animation: true,
                          backgroundColor: '${_evoColor.outputHex}',
                          color: $_color,
                          title: {
                              text: '$title',
                              subtext: '$fromDate - $toDate',
                              left: 'center',
                              textStyle:{
                                  color: '${_evoColor.outputFontHex}'
                              }
                          },
                          tooltip: {
                              trigger: 'item',
                              formatter: '{a} <br/>{b} : {c} ({d}%)',
                              position: ['5%', '57.8%'],
                          },
                          
                          legend: {
                              type: 'scroll',
                              orient: 'vertical',
                              top: '66%',
                              align: 'auto',
                              textStyle: {
                                 fontFamily: 'Monospace',
                                 fontSize: 10.5,
                                 color: '${_evoColor.outputFontHex}'
                              },
                              pageButtonItemGap : 50,
                              pageButtonPosition: 'end',
                              pageIconSize: 25,
                              data: $legend,
                              pageIconColor: '#3498DB',
                              formatter: function (name) {
                                var currentName = name;
                                var length = $_legendNameMaxLength;
                                var trimmedName = currentName.length > length ? currentName.substring(0, length - 3) + "..." : currentName;
                                var values = $legendValue;
                                var percent = $legendPercent;
                                return trimmedName.padEnd($_legendNamePadding) + values[0][name].padStart($_legendValuePadding) + percent[0][name].padStart($_legendPercentPadding) + '%';
                                // return trimmedName.padEnd($_legendNamePadding) + values[0][name].padStart($_legendValuePadding);
                              }
                          },
                          
                          series: [
                              ${_EvoPieChartStructure(
          name: name1,
          radius: _radius1,
          series: series1,
        ).drawChart()}
                              $_outerChart
                          ],
                          "RawData": null
                        }
                '''
    );
  }
}