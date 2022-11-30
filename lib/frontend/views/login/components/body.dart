import 'package:medical_app/config/constants.dart';
import 'package:medical_app/frontend/utilities/rounded_button.dart';
import 'package:flutter/material.dart';
import '../../../utilities/account_check_nav.dart';
import '../../../utilities/password_input.dart';
import '../../../utilities/text_input.dart';
import '../../sign_up/sign_up.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

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
                children: const [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  TextInput(
                    icon: Icon(Icons.alternate_email),
                    text: 'Email ID',
                    inputType: TextInputType.emailAddress,
                  ),
                  PasswordInput(),
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
              action: () {},
            ),
            AccountCheckNav(
              firstText: 'Don\'t have an account?',
              secondText: 'Register',
              action: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const SignUpView();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
