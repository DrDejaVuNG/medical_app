import 'package:medical_app/config/constants.dart';
import 'package:medical_app/frontend/utilities/account_check_nav.dart';
import 'package:medical_app/frontend/utilities/rounded_button.dart';
import 'package:medical_app/frontend/utilities/text_input.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              IconButton(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(top: 10),
                splashRadius: 20,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
              ),
            ],
          ),
          Image.asset('assets/images/signup.jpg'),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Sign up',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextInput(
                  text: 'Email ID',
                  icon: Icon(Icons.alternate_email),
                ),
                TextInput(
                  text: 'Full Name',
                  icon: Icon(Icons.person_outline),
                ),
                TextInput(
                  text: 'Mobile',
                  icon: Icon(Icons.phone_iphone_outlined),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
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
          const SizedBox(height: 10),
          RoundedButton(text: 'Continue', action: () {}),
          AccountCheckNav(
            firstText: 'Joined us before?',
            secondText: 'Login',
            action: () {},
          )
        ],
      ),
    );
  }
}
