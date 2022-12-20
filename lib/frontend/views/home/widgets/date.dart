import 'package:flutter/material.dart';
import 'package:medical_app/config/constants.dart';

class Date extends StatelessWidget {
  const Date({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime day = DateTime.now();
    DateTime month = DateTime.now();

    return const Text(
      'Today, 6 December',
      style: TextStyle(
        color: kPrimaryColor,
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
