import 'package:aw_noti/services/awesome_noti.dart';
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
    name: 'local-noti',
    options: const FirebaseOptions(
      apiKey: 'your-api-key',
      appId: '1:408136830883:android:4ab0d0960c2164d6239416',
      messagingSenderId: 'your-sender-id',
      projectId: 'local-noti-95efb',
    ),
  );
  await AwesomeNotificationController.init();
  runApp(const TheApp());
}
