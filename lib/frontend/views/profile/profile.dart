import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medical_app/config/constants.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  void logUserOut() async {
    FirebaseAuth.instance.signOut;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  children: [
                    const Text(
                      'Profile',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: logUserOut,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border(
                            top: BorderSide(color: kPrimaryColor, width: 1.5),
                            bottom:
                                BorderSide(color: kPrimaryColor, width: 1.5),
                            left: BorderSide(color: kPrimaryColor, width: 1.5),
                            right: BorderSide(color: kPrimaryColor, width: 1.5),
                          ),
                        ),
                        child: const Icon(Icons.settings_outlined),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 3, color: kPrimaryColor),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 2, color: Colors.transparent),
                    ),
                    child: const CircleAvatar(
                      radius: 60,
                      backgroundImage:
                          AssetImage('assets/images/doctor_img.jpg'),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  'Paul Anko Seyon',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  '16 years old',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
