import 'package:flutter/material.dart';

class ColorThemes{
  static final String
      hexLight = '#fff',
      hexDark = '#263238',
      hexCurrent = hexDark,
      hexCurrentFont = '#000';

  static final String
      chartColor1 = '["#16458a","#42c6bb","#bff255","#ff5b5b","#bb414b","#ed70d4","#8f0816","#9ec6e7","#e5c87c","#9de16d","#e3a5f8","#48535f","#fc1565","#815ff2","#8ae0e1","#eda33c","#47d88a","#e57b52","#f6d24d","#066312","#d3f896","#db76d1","#d06c38","#73a1d8","#7fea66","#bcdb6c","#f695b5","#fcb72d","#f82e52","#1edb05"]',
      chartColor2 = "['#d87c7c','#919e8b', '#d7ab82', '#6e7074','#61a0a8','#efa18d', '#787464', '#cc7e63', '#724e58', '#4b565b']",
      chartColor3 = "['#dd6b66','#759aa0','#e69d87','#8dc1a9','#ea7e53','#eedd78','#73a373','#73b9bc','#7289ab', '#91ca8c','#f49f42']",
      chartColor4 = "['#2ec7c9','#b6a2de','#5ab1ef','#ffb980','#d87a80','#8d98b3','#e5cf0d','#97b552','#95706d','#dc69aa','#07a2a4','#9a7fd1','#588dd5','#f5994e','#c05050','#59678c','#c9ab00','#7eb00a','#6f5553','#c14089']",
      chartColor5 = "['#C1232B','#27727B','#FCCE10','#E87C25','#B5C334','#FE8463','#9BCA63','#FAD860','#F3A43B','#60C0DD','#D7504B','#C6E579','#F4E001','#F0805A','#26C0C0']",
      chartColor6 = "['#c12e34','#e6b600','#0098d9','#2b821d','#005eaa','#339ca8','#cda819','#32a487']",
      chartColor7 = "['#E01F54','#001852','#f5e8c8','#b8d2c7','#c6b38e','#a4d8c2','#f3d999','#d3758f','#dcc392','#2e4783','#82b6e9','#ff6347','#a092f1','#0a915d','#eaf889','#6699FF','#ff6666','#3cb371','#d5b158','#38b6b6']",
      chartColor8 = "['#b44138','#334553','#6f9fa7','#c9866b','#9cc5b0','#7d9e85','#c1883a','#6f7074','#57656f','#c6ccd2']";

  static List chartColors() =>
      [
        chartColor1,
        chartColor4,
        chartColor5,
        chartColor3,
        chartColor6,
        chartColor7,
        chartColor8,
        chartColor2,
      ];

  static List listColors() =>
      [
        Colors.lightBlue,
        Colors.red,
        Colors.black,
        Colors.green,
        Colors.orange[800],
        Colors.yellow,
        Colors.amber,
        Colors.pink,
        Colors.grey,
        Colors.indigo,
        Colors.purple,
        Colors.greenAccent,
      ];
}