import 'package:flutter/material.dart';
import 'package:medical_app/config/constants.dart';

import 'notification.dart';

class NotifyView extends StatelessWidget {
  const NotifyView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
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
            Flexible(
              child: ListView.builder(
                itemCount: 15,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return const NotificationCard();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
