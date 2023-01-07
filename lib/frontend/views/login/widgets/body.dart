import 'package:medical_app/frontend/utils/password_input.dart';
import 'package:medical_app/frontend/utils/text_input.dart';

import '../../sign_up/sign_up.dart';
import 'package:flutter/material.dart';
import '../../../utils/account_check_nav.dart';
import 'package:medical_app/config/constants.dart';
import 'package:medical_app/frontend/utils/bottom_nav.dart';
import 'package:medical_app/frontend/utils/rounded_button.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

  final email = TextEditingController();
  final password = TextEditingController();


  void logUserIn() {}

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Image.asset('assets/images/login.jpg'),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextInput(
                    controller: email,
                    icon: const Icon(Icons.alternate_email),
                    text: 'Email ID',
                    inputType: TextInputType.emailAddress,
                  ),
                  PasswordInput(controller: password),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            RoundedButton(
              text: 'Login',
              width: MediaQuery.of(context).size.width * 0.8,
              action: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BottomNav()),
                );
              },
            ),
            AccountCheckNav(
              firstText: 'Don\'t have an account?',
              secondText: 'Register',
              action: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpView()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
