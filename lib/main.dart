import 'package:get/get.dart';
import 'databases/user_db.dart';
import 'models/user_model.dart';
import 'providers/refresh.dart';
import 'config/color_schemes.dart';
import 'config/configuration.dart';
import 'providers/page_state.dart';
import 'models/medication_model.dart';
import 'package:flutter/material.dart';
import 'models/appointment_model.dart';
import 'models/notification_model.dart';
import 'package:provider/provider.dart';
import 'providers/appointment_state.dart';
import 'package:medical_app/widget_tree.dart';
import 'package:connectivity/connectivity.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  // Init Hive
  await Hive.initFlutter();

  // Adapters
  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(MedicationModelAdapter());
  Hive.registerAdapter(AppointmentModelAdapter());
  Hive.registerAdapter(NotificationModelAdapter());

  // Open Box
  await Hive.openBox('Box');

  // Internet Check
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.none) {
    i = 0;
  }

  // Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Load Data
  configuration();

  // Run App
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AppointmentState(),
        ),
        ChangeNotifierProvider(
          create: (context) => PageState(),
        ),
        ChangeNotifierProvider(
          create: (context) => RefreshState(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Lasu Medical',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      home: const WidgetTree(),
    );
  }
}
