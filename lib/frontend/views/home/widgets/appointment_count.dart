import 'package:flutter/material.dart';
import 'package:medical_app/databases/appointment_db.dart';

class AppointmentCount extends StatelessWidget {
  AppointmentCount({
    Key? key,
  }) : super(key: key);

  final num = displayList.length;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        'You have $num appointments today',
        style: const TextStyle(color: Colors.grey),
      ),
    );
  }
}
