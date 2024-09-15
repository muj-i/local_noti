import 'package:firebase_messaging/firebase_messaging.dart';

abstract class FcmService {
  static init() {

    subscribeToNotificationByUserId('123xxx');
    firebaseForegroundHandler();
  }


  static void firebaseForegroundHandler() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');
      print('Messagetitle${message.notification?.title}');
      print('Messagebody${message.notification?.body}');
      print('Messageid has${message.messageId?.hashCode}');
      print('Messageid ${message.messageId}');
      // final id = Random().nextInt(2147483647);
      // AwesomeNotifications().createNotification(
      //   content: NotificationContent(
      //       id: id,
      //       channelKey: "hell",
      //       title: message.notification!.title!,
      //       body: message.notification!.body!),
      // );
      print(
          'Message !also contained a notification: ${message.notification?.title}');
    });
  }

  static void subscribeToNotificationByUserId(String userId) {
    FirebaseMessaging.instance.subscribeToTopic('123xxx');
  }

  void unsubscribeToNotificationByUserId(String userId) {
    FirebaseMessaging.instance.unsubscribeFromTopic(userId);
  }
}