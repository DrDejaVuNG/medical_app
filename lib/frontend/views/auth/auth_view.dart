import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medical_app/frontend/utils/bottom_nav.dart';
import 'package:medical_app/frontend/views/welcome/welcome.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // user is logged in
          if (snapshot.hasData) {
            return const BottomNav();
          }

          // user not logged in
          else {
            return const WelcomeView();
          }
        },
      ),
    );
  }
}