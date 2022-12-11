import 'package:flutter/material.dart';

class AppointmentCount extends StatelessWidget {
  const AppointmentCount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        'You have 3 appointments today',
        style: TextStyle(color: Colors.grey),
      ),
    );
  }
}
