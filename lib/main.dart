import 'package:aw_noti/firebase_options.dart';
import 'package:aw_noti/services/fcm_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';

import './the_app.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  print('Got a message whilst in the background!');
  print('Message data: ${message.data}');
  print('Messagetitle${message.notification?.title}');
  print('Messagebody${message.notification?.body}');
  print('Messageid has${message.messageId?.hashCode}');
  print('Messageid ${message.messageId}');

  // final id = Random().nextInt(2147483647);
  // AwesomeNotifications()
  //     .createNotification(
  //   content: NotificationContent(
  //     id: id,
  //     channelKey: "hell",
  //     title: message.notification?.title ?? '',
  //     body: message.notification?.body ?? '',
  //   ),
  // )
  //     .then((value) {
  //   Future.delayed(const Duration(seconds: 6))
  //       .then((value) => AwesomeNotifications().cancel(id));
  // });

  print(
      'Message !also contained a notification: ${message.notification?.title}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
//   //!Awesome Notification
//   await AwesomeNotifications().initialize(null, [
//     NotificationChannel(
//       onlyAlertOnce: true,
//       groupAlertBehavior: GroupAlertBehavior.Children,
//       importance: NotificationImportance.High,
//       channelGroupKey: "hell_grp",
//       channelKey: "hell",
//       channelName: "hell_channel",
//       channelDescription: "hell_description",
//     )
//   ], channelGroups: [
//     NotificationChannelGroup(
//       channelGroupKey: "getfit_client_channel_group",
//       channelGroupName: "Getfit Client Notification Group",
//     )
//   ]);
//   bool isAllowedToSendNotification =
//       await AwesomeNotifications().isNotificationAllowed();
//   if (!isAllowedToSendNotification) {
//     AwesomeNotifications().requestPermissionToSendNotifications();
//   }
// //!Awesome Notification

  await FcmService.init();
  runApp(const TheApp());
}
