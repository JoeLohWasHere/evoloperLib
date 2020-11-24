import 'package:flutter/material.dart';

class EvoFocusManager extends StatelessWidget {
  final Widget child;
  final Function function;

  EvoFocusManager({this.child, this.function});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
          FocusScope.of(context).requestFocus(new FocusNode());

          try{
            function();
          }catch(e){}
        },
        child: this.child
    );
  }
}