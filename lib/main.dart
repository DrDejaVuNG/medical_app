import 'package:medical_app/config/constants.dart';
import 'package:flutter/material.dart';
import 'frontend/views/welcome/welcome.dart';

void main() {
  runApp(const MyApp());
}

// Main
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lasu Medical',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const WelcomeView(),
    );
  }
}
