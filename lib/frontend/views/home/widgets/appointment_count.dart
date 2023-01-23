import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:medical_app/databases/appointment_db.dart';

class AppointmentCount extends StatelessWidget {
  const AppointmentCount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int num = 0;
    DateTime day = DateTime.now();
    final date = DateFormat('EEEE, MMMM d, y').format(day);
    for (var appointment in appointmentList) {
      if (appointment.status != 'Declined' &&
          appointment.status != 'Completed') {
        if (date == appointment.date) {
          num = ++num;
        }
      }
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        'You have $num appointments today',
        style: const TextStyle(color: Colors.grey),
      ),
    );
  }
}
