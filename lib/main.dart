import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:medical_app/frontend/views/auth/auth_view.dart';
import 'package:provider/provider.dart';
import 'models/appointment_model.dart';
import 'providers/appointment_state.dart';
import 'providers/input_state.dart';
import 'providers/page_state.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  // init hive
  await Hive.initFlutter();

  // open a box
  await Hive.openBox('myBox');

  // adapters
  Hive.registerAdapter(AppointmentAdapter());

  // firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // run app
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
          create: (context) => InputState(),
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
    return MaterialApp(
      title: 'Lasu Medical',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const AuthView(),
    );
  }
}
