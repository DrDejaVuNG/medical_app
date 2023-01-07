import 'package:firebase_auth/firebase_auth.dart';
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

  void signUserUp() async {
    // sign up
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        // print('Email is already in use');
      } else if (e.code == 'weak-password') {
        // print('Weak Password');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    bool obscureText = true;
    void toggle() {
      obscureText = !obscureText;
    }

    Size size = MediaQuery.of(context).size;
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
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    height: size.height * 0.07,
                    width: size.width * 0.9,
                    child: TextFormField(
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.alternate_email),
                        hintText: 'Email ID',
                      ),
                      validator: (value) {
                        if (value == null) {
                          return 'Enter Email';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    height: size.height * 0.07,
                    width: size.width * 0.9,
                    child: TextFormField(
                      controller: name,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person_outline),
                        hintText: 'Full Name',
                      ),
                      validator: (value) {
                        if (value == null) {
                          return 'Enter Full Name';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    height: size.height * 0.07,
                    width: size.width * 0.9,
                    child: TextFormField(
                      controller: mobile,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.phone_iphone_outlined),
                        hintText: 'Mobile',
                      ),
                      validator: (value) {
                        if (value == null) {
                          return 'Enter Mobile';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    height: size.height * 0.07,
                    width: size.width * 0.9,
                    child: TextFormField(
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        icon: const Icon(Icons.lock_outlined),
                        hintText: 'Password',
                        suffixIcon: IconButton(
                          splashRadius: 1,
                          onPressed: toggle,
                          icon: Icon(obscureText
                              ? Icons.visibility_sharp
                              : Icons.visibility_off),
                        ),
                      ),
                      validator: (value) {
                        if (value == null) {
                          return 'Enter Password';
                        }
                        return null;
                      },
                    ),
                  ),
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
              action: signUserUp,
            ),
          ],
        ),
      ),
    );
  }
}
