import 'package:aw_noti/firebase_options.dart';
import 'package:aw_noti/services/awesome_noti.dart';
import 'package:aw_noti/services/awsm_fcm_services.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';

import './the_app.dart';

// @pragma('vm:entry-point')
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await AwsmFcmServices.initializeRemoteNotifications(debug: false);
  await AwesomeNotificationController.init();
  runApp(const TheApp());
}
