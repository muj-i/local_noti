import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:local_notification/local_notification.dart';

class TheApp extends StatelessWidget {
  const TheApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.blueAccent),
            foregroundColor: WidgetStateProperty.all(Colors.white),
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
        ),
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // AwesomeNotificationController.setListeners();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('The App'),
      ),
      body: const Center(
        child: Text('Hello, World!'),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            onPressed: () {
              // AwesomeNotificationController.requestUserPermissions(
              //   context,
              //   channelKey: 'hell',
              //   permissionList: [
              //     NotificationPermission.Alert,
              //     NotificationPermission.Badge,
              //     NotificationPermission.Sound,
              //     NotificationPermission.Vibration,
              //   ],
              // );
              LocalNotification.init('The App');
            },
            child: const Text('Seak Permission'),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            onPressed: () {
              // Future.delayed(const Duration(seconds: 10)).then((value) {
              //   AwesomeNotifications().createNotification(
              //     content: NotificationContent(
              //       id: 10,
              //       channelKey: 'hell',
              //       title: 'Hello, World!',
              //       body: 'This is a notification from The App',
              //     ),
              //   );
              // });
              LocalNotification.showLocalNotification(
                10,
                'Hello, World!',
                'This is a notification from The App',
              );
            },
            child: const Icon(Icons.notifications),
          ),
        ],
      ),
    );
  }
}
