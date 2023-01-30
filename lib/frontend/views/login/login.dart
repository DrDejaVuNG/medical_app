import 'package:flutter/material.dart';
import '../../utils/account_check_nav.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:medical_app/config/constants.dart';
import 'package:medical_app/backend/auth/auth.dart';
import 'package:medical_app/frontend/utils/rounded_button.dart';
import 'package:medical_app/frontend/views/sign_up/sign_up.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String? errorMessage = '';

  final email = TextEditingController();
  final password = TextEditingController();

  bool obscureText = true;
  bool isLoading = false;

  void logUserIn() async {
    loading();
    // login
    try {
      await Auth().logUserIn(
        email: email.text,
        password: password.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
    loading();
  }

  void loading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  void toggle() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                      controller: password,
                      obscureText: obscureText,
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
              widget: isLoading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2.5,
                      ),
                    )
                  : const Text('Login'),
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
    ),
      ),
    );
  }
}
