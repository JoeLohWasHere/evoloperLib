import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_echarts/flutter_echarts.dart';
import 'colorThemes.dart';

class BarChartTemplate extends StatelessWidget {
  final String title, subtitle, yAxis, xAxis, data;
  final bool isReverse, isXAxisDisplay;

  BarChartTemplate({this.title, this.subtitle, this.yAxis, this.xAxis, this.data, this.isReverse, this.isXAxisDisplay});
//dark mode
  @override
  Widget build(BuildContext context) {
    return Echarts(
        option: '''
                        {
                          textStyle: {
                            color: '${ColorThemes.hexCurrentFont}'
                          },
                          backgroundColor: '${ColorThemes.hexCurrent}',
                          // color: ['#55a1d5'],
                          color: ['#47a8ee'],
                          // color: ['#39779d'],
                          title: {
                              text: '$title',
                              subtext: '$subtitle',
                              textStyle:{
                                  color: '${ColorThemes.hexCurrentFont}'
                              }
                          },
                          tooltip: {
                              trigger: 'axis',
                              axisPointer: {            
                                  type: 'shadow' 
                              }
                          },
                          grid: {
                              left: 50
                          },
                          xAxis: {
                              type: '${isReverse??false ? 'category':'value'}',
                              data: $xAxis,
                              offset: -6,
                              show: ${isXAxisDisplay??true}
                          },
                          yAxis: {
                              type: '${isReverse??false ? 'value':'category'}',
                              ${isReverse??false ? '//':'data: $yAxis'},
                              offset: -6
                          },
                          series: [{
                              // label:{
                              //     normal: {
                              //         show: true,
                              //         textBorderColor: '#333',
                              //         textBorderWidth: 2
                              //     }
                              // },
                              data: $data,
                              type: 'bar',
                              showBackground: true,
                              backgroundStyle: {
                                  color: 'rgba(0, 0, 0, 0.2)'
                              }
                          }]
                        }
                        '''
    );
  }
}

class BarChartWLegendTemplate extends StatelessWidget {
  final String title, subtitle;
  final List yAxis, xAxis, data;
  final bool isReverse;

  BarChartWLegendTemplate({this.title, this.subtitle, this.yAxis, this.xAxis, this.data, this.isReverse});

  String _seriesBuilder(){
    String _series;
    String _spacer;
    for(var i=0; i<yAxis.length; i++){
      String _comma = ',';
      switch(i){
        case 0:
          _spacer = '';
          _series = _seriesTemplate(yAxis[i], data[i], _spacer);
          break;
        case 1:
          _spacer = _comma;
          _series = '$_series${_seriesTemplate(yAxis[i], data[i], _spacer)}';
          break;
        default:
          _spacer = '$_spacer$_comma';
          _series = '$_series${_seriesTemplate(yAxis[i], data[i], _spacer)}';
      }
    }

    return _series;
  }

  String _seriesTemplate(name, data, spacer){
    return '''{
        name:'$name',
        type:'bar',
        stack: 'stack',
        data:[$spacer$data],
        type: 'bar',
        showBackground: true,
        backgroundStyle: {
          color: 'rgba(0, 0, 0, 0.2)'
        }
      },''';
  }

  @override
  Widget build(BuildContext context) {
    // print();
    return Echarts(
        option: '''
                        {
                          textStyle: {
                            color: '${ColorThemes.hexCurrentFont}'
                          },
                          backgroundColor: '${ColorThemes.hexCurrent}',
                          color: ['#55a1d5'],
                          title: {
                              text: '$title',
                              subtext: '$subtitle',
                              textStyle:{
                                  color: '${ColorThemes.hexCurrentFont}'
                              }
                          },
                          tooltip: {
                              trigger: 'axis',
                              axisPointer: {            
                                  type: 'shadow' 
                              }
                          },
                          xAxis: {
                              type: '${isReverse??false ? 'category':'value'}',
                          },
                          yAxis: {
                              type: 'category',
                              ${isReverse??false ? '':'data: ${json.encode(yAxis)}'},
                              offset: -5
                          },
                          legend: {
                            data: ${json.encode(yAxis)},
                            textStyle: {
                                 fontFamily: 'Monospace',
                                 fontSize: 10.5,
                                 color: '${ColorThemes.hexCurrentFont}'
                              },
                          },
                          series: [${_seriesBuilder()}]
                        }
                        '''
    );
  }
}

class PieChartStructure{
  String name, radius, series, _quoter;
  bool outer = false;

  PieChartStructure({this.name, this.radius, this.series});

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

class SimplePieChartTemplate extends StatelessWidget {
  final String title, subtitle, category, series, legend;

  SimplePieChartTemplate({this.title, this.subtitle, this.category, this.series, this.legend});

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
                              ${PieChartStructure(
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
class PieChartTemplate extends StatelessWidget {
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

  PieChartTemplate({
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
      return PieChartStructure(
        name: name2,
        radius: _radius,
        series: series2,
      ).drawChart();
    }

    _drawChart3(){
      return PieChartStructure(
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
    this.color == null ? _color = ColorThemes.chartColor1 : _color = this.color;
    _getOuterChart();
    //dark mode
    return Echarts(
        option: '''
                        {
                          animation: true,
                          backgroundColor: '${ColorThemes.hexCurrent}',
                          color: $_color,
                          title: {
                              text: '$title',
                              subtext: '$fromDate - $toDate',
                              left: 'center',
                              textStyle:{
                                  color: '${ColorThemes.hexCurrentFont}'
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
                                 color: '${ColorThemes.hexCurrentFont}'
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
                              ${PieChartStructure(
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