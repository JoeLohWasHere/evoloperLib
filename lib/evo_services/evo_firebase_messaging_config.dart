import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class FirebaseMessagingConfiguration {
  final FirebaseMessaging _firebaseMessaging = new FirebaseMessaging();
  final Function afterAction;
  final Color gradientColor1, gradientColor2;
  bool duplicate = false;

  FirebaseMessagingConfiguration({
    this.afterAction, this.gradientColor1, this.gradientColor2
  });

  void _showFloatingFlush(BuildContext context, title, message) {
    switch (duplicate) {
      case false:
        Flushbar(
          padding: EdgeInsets.all(10),
          borderRadius: 8,
          backgroundGradient: LinearGradient(
            colors: [gradientColor1??Colors.white, gradientColor2??Colors.white],
            stops: [0.6, 1],
          ),
          boxShadows: [
            BoxShadow(
              color: Colors.black45,
              offset: Offset(3, 3),
              blurRadius: 3,
            ),
          ],
          dismissDirection: FlushbarDismissDirection.HORIZONTAL,
          forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
          title: title,
          message: message,
          duration: Duration(seconds: 15),
        )
          ..show(context);
        duplicate = true;
        break;
      default:
        duplicate = false;
    }
  }

  Future<void> fbConfiguration(context) async{
    _firebaseMessaging.configure(
        onMessage: (Map<String, dynamic> message) async {
          print('onMessage: $message');
          final notification = message['notification'];

          try{
            _showFloatingFlush(context, notification['title'], notification['body']);
            this.afterAction();
          }catch(e){
            print('Notification Error: $e');
          }
        },

        onLaunch:  (Map<String, dynamic> message) async {
          print('onLaunch: $message');
        },

        onResume:  (Map<String, dynamic> message) async {
          print('onResume: $message');
        }
    );
  }
}