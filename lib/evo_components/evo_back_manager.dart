import 'package:flutter/material.dart';

class EvoBackManager extends StatelessWidget{
  final Function navigator;
  final Widget child;

  EvoBackManager({this.navigator, this.child});

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: (){
        navigator();
        return Future.value(false);
      },
      child: child,
    );
  }
}