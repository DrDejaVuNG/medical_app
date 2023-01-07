import '../../../utils/password_input.dart';
import '../../../utils/text_input.dart';
import 'package:flutter/material.dart';
import 'package:medical_app/config/constants.dart';
import 'package:medical_app/frontend/utils/rounded_button.dart';

class Body extends StatelessWidget {
  Body({
    Key? key,
  }) : super(key: key);

  final name = TextEditingController();
  final email = TextEditingController();
  final mobile = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/signup.jpg'),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Sign up',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextInput(
                    text: 'Email ID',
                    icon: const Icon(Icons.alternate_email),
                    inputType: TextInputType.emailAddress,
                    controller: email,
                  ),
                  TextInput(
                    text: 'Full Name',
                    icon: const Icon(Icons.person_outline),
                    inputType: TextInputType.name,
                    controller: name,
                  ),
                  TextInput(
                    text: 'Mobile',
                    icon: const Icon(Icons.phone_iphone_outlined),
                    inputType: TextInputType.phone,
                    controller: mobile,
                  ),
                  PasswordInput(controller: password),
                ],
              ),
            ),
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
          ],
        ),
      ),
    );
  }
}
