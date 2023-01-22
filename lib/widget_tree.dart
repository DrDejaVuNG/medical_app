import 'package:flutter/material.dart';
import 'package:medical_app/frontend/utils/bottom_nav.dart';
import 'package:medical_app/frontend/views/auth/auth.dart';
import 'package:medical_app/frontend/views/login/login.dart';

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        // user is logged in
        if (snapshot.hasData) {
          return const BottomNav();
        }

        // user not logged in
        else {
          return const LoginView();
        }
      },
    );
  }
}
