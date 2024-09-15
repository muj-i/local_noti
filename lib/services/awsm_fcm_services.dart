import 'dart:developer';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:awesome_notifications_fcm/awesome_notifications_fcm.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';

class AwsmFcmServices {
  static Future<void> initializeRemoteNotifications(
      {required bool debug}) async {
    //   await Firebase.initializeApp(
    // name: 'local-noti',
    // options: const FirebaseOptions(
    //   apiKey: 'AIzaSyAVxfmF7IdG8fPu0oC6id9_fkqUbCQe4pw',
    //   appId: '1:408136830883:android:4ab0d0960c2164d6239416',
    //   messagingSenderId: '408136830883',
    //   projectId: 'local-noti-95efb',
    // ),
  // );
    await AwesomeNotificationsFcm().initialize(
        onFcmSilentDataHandle: mySilentDataHandle,
        onFcmTokenHandle: myFcmTokenHandle,
        onNativeTokenHandle: myNativeTokenHandle,
        debug: debug);
    final tok = await AwesomeNotificationsFcm().requestFirebaseAppToken();
    log("tok: $tok");
    AwesomeNotificationsFcm().subscribeToTopic('123xxx');
  }
}

///  *********************************************
///     REMOTE NOTIFICATION EVENTS
///  *********************************************

/// Use this method to execute on background when a silent data arrives
/// (even while terminated)
@pragma("vm:entry-point")
Future<void> mySilentDataHandle(FcmSilentData silentData) async {
  log('"SilentData": ${silentData.toString()}');

  if (silentData.createdLifeCycle != NotificationLifeCycle.Foreground) {
    log("bg");
  } else {
    log("FOREGROUND");
  }

  log("starting long task");
  await Future.delayed(const Duration(seconds: 4));
  const url = ("http://google.com");
  final re = await Dio().get(url);
  log(re.data);
  log("long task done");
}

/// Use this method to detect when a new fcm token is received
@pragma("vm:entry-point")
Future<void> myFcmTokenHandle(String token) async {
  log('FCM Token:"$token"');
}

/// Use this method to detect when a new native token is received
@pragma("vm:entry-point")
Future<void> myNativeTokenHandle(String token) async {
  log('Native Token:"$token"');
}
