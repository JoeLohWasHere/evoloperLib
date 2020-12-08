import 'package:alice/alice.dart';
import 'package:flutter/cupertino.dart';

AliceInterceptor aliceInterceptor = AliceInterceptor(darkTheme: false);
GlobalKey<NavigatorState> navigatorKey =  GlobalKey<NavigatorState>();
bool DEBUG_MODE = true;

class AliceInterceptor{
  Alice alice;

  AliceInterceptor({bool darkTheme}){
    alice = Alice(showNotification: true, navigatorKey: navigatorKey,darkTheme: darkTheme);
  }


}
