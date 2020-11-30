import 'package:evo_lib/evo_components/evo_color.dart';
import 'package:evo_lib/evo_services/evo_string_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_echarts/flutter_echarts.dart';

class EvoBarChartTemplate extends StatelessWidget{
  final String title, subtitle;
  final List xAxis, yAxis, data;
  final bool isReverse, isXAxisDisplay, isDarkMode;

  EvoBarChartTemplate({this.title, this.subtitle, this.yAxis, this.xAxis, this.data, this.isReverse, this.isXAxisDisplay, this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    EvoColor _evoColor = new EvoColor(isDark: isDarkMode);
    print(_evoColor.outputFontHex);
    return Echarts(
        option: '''
                        {
                          textStyle: {
                            color: '${_evoColor.outputFontHex}'
                          },
                          backgroundColor: '${_evoColor.outputHex}',
                          // color: ['#55a1d5'],
                          color: ['#47a8ee'],
                          // color: ['#39779d'],
                          title: {
                              text: '$title',
                              subtext: '$subtitle',
                              textStyle:{
                                  color: '${_evoColor.outputFontHex}'
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
                              data: ${EvoStringFormat().getStringFromList(xAxis)},
                              offset: -6,
                              show: ${isXAxisDisplay??true}
                          },
                          yAxis: {
                              type: '${isReverse??false ? 'value':'category'}',
                              ${isReverse??false ? '//':'data: ${EvoStringFormat().getStringFromList(yAxis)}'},
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
                              data: ${EvoStringFormat().getStringFromList(data)},
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