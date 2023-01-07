import '../../sign_up/sign_up.dart';
import 'package:flutter/material.dart';
import '../../login/widgets/form.dart';
import '../../../utils/account_check_nav.dart';
import 'package:medical_app/config/constants.dart';
import 'package:medical_app/frontend/utils/bottom_nav.dart';
import 'package:medical_app/frontend/utils/rounded_button.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  void logUserIn() {
    
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Image.asset('assets/images/login.jpg'),
            const SizedBox(height: 5),
            const FormWidget(),
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
