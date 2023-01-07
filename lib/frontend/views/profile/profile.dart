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
    final size = MediaQuery.of(context).size;
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
                const SizedBox(height: 25),
                const Text(
                  'Stats',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      width: size.width * 0.42,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.red.shade100,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Blood group',
                            style: TextStyle(
                                fontSize: 15, color: Colors.red.shade800),
                          ),
                          const SizedBox(height: 15),
                          const Text(
                            'A+',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 25),
                    Container(
                      width: size.width * 0.42,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.green.shade100,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Weight',
                            style: TextStyle(
                                fontSize: 15, color: Colors.green.shade800),
                          ),
                          const SizedBox(height: 15),
                          const Text(
                            '80kg',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: const Border(
                      top: BorderSide(
                        color: kPrimaryColor,
                        width: 2,
                      ),
                      right: BorderSide(
                        color: kPrimaryColor,
                        width: 2,
                      ),
                      bottom: BorderSide(
                        color: kPrimaryColor,
                        width: 2,
                      ),
                      left: BorderSide(
                        color: kPrimaryColor,
                        width: 2,
                      ),
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: const [
                      Text(
                        'Total Appointments',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: const [
                    Text(
                      'Recent Appointments',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
