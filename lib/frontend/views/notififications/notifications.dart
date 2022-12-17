import 'package:flutter/material.dart';
import 'package:medical_app/config/constants.dart';

class NotifyView extends StatelessWidget {
  const NotifyView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(
                    color: kPrimaryColor,
                    width: 2,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 15,
                      backgroundImage:
                          AssetImage('assets/images/doctor_img.jpg'),
                    ),
                    const SizedBox(width: 25),
                    const Text(
                      'Notifications',
                      style: TextStyle(
                        fontSize: 20,
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: const Icon(Icons.settings_outlined),
                    ),
                  ],
                ),
              ),
            ),
            // ListView.builder(
            //   itemCount: 5,
            //   itemBuilder: (context, index) {
            //     return Container(
            //       decoration: const BoxDecoration(
            //         border: Border(bottom: BorderSide(color: kPrimaryColor)),
            //       ),
            //       child: SizedBox(
            //         height: 65,
            //         child: Padding(
            //           padding: const EdgeInsets.all(20),
            //           child: Column(
            //             children: const [
            //               Text('Notification'),
            //               SizedBox(height: 5),
            //               Text('This is a notification'),
            //             ],
            //           ),
            //         ),
            //       ),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
