import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// Initialize the plugin
final localNotifications = FlutterLocalNotificationsPlugin();

Future initialize() async {
  var androidInitialize = const AndroidInitializationSettings('ic_launcher');
  var initializationsSettings =
      InitializationSettings(android: androidInitialize);
  await localNotifications.initialize(initializationsSettings,
      onDidReceiveNotificationResponse:
          (NotificationResponse notificationResponse) async {});
}

notificationDetails() {
  return const NotificationDetails(
    android: AndroidNotificationDetails(
      'channel_Id_0',
      'channel_name',
      playSound: true,
      // sound: RawResourceAndroidNotificationSound('notification'),
      importance: Importance.max,
      priority: Priority.high,
    ),
  );
}

Future showNotification({
  int id = 0,
  required String title,
  required String description,
  String? payload,
}) async {
  return localNotifications.show(
    id,
    title,
    description,
    await notificationDetails(),
  );
}



// // Configure the plugin
// var initializationSettingsAndroid = const AndroidInitializationSettings('app_icon');
// var initializationSettingsIOS = const IOSInitializationSettings();
// var initializationSettings = InitializationSettings(android: 
//     initializationSettingsAndroid, iOS: initializationSettingsIOS);
// await notifications.initialize(initializationSettings,
//     onSelectNotification = (String payload) async {
//   // handle notification tap
// });

// // Schedule a notification
// var scheduledNotificationDateTime =
//     DateTime.now().add(const Duration(seconds: 5));
// var androidPlatformChannelSpecifics = AndroidNotificationDetails(
//     'your channel id', 'your channel name', 'your channel description',
//     importance: Importance.Max,
//     priority: Priority.High,
//     ticker: 'ticker');
// var iOSPlatformChannelSpecifics = const IOSNotificationDetails();
// var platformChannelSpecifics = NotificationDetails(
//     androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
// await flutterLocalNotificationsPlugin.schedule(
//     0,
//     'Your title',
//     'Your message',
//     scheduledNotificationDateTime,
//     platformChannelSpecifics,
//     payload = 'item x',
//     androidAllowWhileIdle = true);
