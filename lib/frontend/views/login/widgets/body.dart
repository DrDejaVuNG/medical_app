import 'package:firebase_auth/firebase_auth.dart';
import '../../sign_up/sign_up.dart';
import 'package:flutter/material.dart';
import '../../../utils/account_check_nav.dart';
import 'package:medical_app/config/constants.dart';
import 'package:medical_app/frontend/utils/rounded_button.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final email = '';
  final password = '';

  bool obscureText = true;

  void logUserIn() async {
    // loading circle
    // showDialog(
    //   context: context,
    //   builder: (context) {
    //     return const Center(
    //       child: CircularProgressIndicator(),
    //     );
    //   },
    // );

    // login
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: 'test@gmail.com',
        password: 'test123',
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // print('User not found');
      } else if (e.code == 'wrong-password') {
        // print('Passwprd Incorrect');
      }
    }

    // ignore: use_build_context_synchronously
    // Navigator.pop(context);
  }

  void toggle() {
    obscureText = !obscureText;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    height: size.height * 0.07,
                    width: size.width * 0.9,
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.alternate_email),
                        hintText: 'Email ID',
                      ),
                      onChanged: (value) {},
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
                    ),
                  ),
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
              action: logUserIn,
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
