import 'package:aw_noti/services/awesome_noti.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

import './the_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Firebase.initializeApp();
  AwesomeNotificationController.init();
  runApp(const TheApp());
}
