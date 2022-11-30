import 'package:medical_app/config/constants.dart';
import 'package:medical_app/frontend/views/login/login.dart';
import 'package:flutter/material.dart';
import '../../../utilities/rounded_button.dart';
import '../../sign_up/sign_up.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              'WELCOME!',
              style: TextStyle(
                color: kPrimaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Image.asset('assets/images/welcome.jpg'),
            RoundedButton(
              text: 'LOGIN',
              textColor: Colors.white,
              color: kPrimaryColor,
              action: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return const LoginView();
                  }),
                );
              },
            ),
            RoundedButton(
              text: 'SIGN UP',
              textColor: kPrimaryColor,
              color: kPrimaryLightColor,
              border: Border.all(
                color: kPrimaryColor,
                width: 1.5,
              ),
              action: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return const SignUpView();
                  }),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
