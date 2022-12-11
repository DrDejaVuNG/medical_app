import 'form.dart';
import 'package:medical_app/frontend/views/login/login.dart';
import 'package:flutter/material.dart';
import 'package:medical_app/config/constants.dart';
import 'package:medical_app/frontend/utils/account_check_nav.dart';
import 'package:medical_app/frontend/utils/rounded_button.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/signup.jpg'),
            const FormWidget(),
            Padding(
              padding: const EdgeInsets.only(
                left: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Text(
                        'By signing up, you agree to our ',
                        style: TextStyle(color: kBackground, fontSize: 13),
                      ),
                      Text(
                        'Terms & Conditions ',
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      Text(
                        'and ',
                        style: TextStyle(color: kBackground, fontSize: 13),
                      ),
                      Text(
                        'Privacy Policy',
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            RoundedButton(
              text: 'Continue',
              width: MediaQuery.of(context).size.width * 0.8,
              action: () {},
            ),
            AccountCheckNav(
              firstText: 'Joined us before?',
              secondText: 'Login',
              action: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginView()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
