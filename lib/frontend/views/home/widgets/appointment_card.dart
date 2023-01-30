import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import '../../appointment/view_appointment.dart';
import 'package:medical_app/databases/user_db.dart';
import 'package:medical_app/providers/refresh.dart';
import 'package:medical_app/models/appointment_model.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({
    Key? key,
    required this.appointment,
  }) : super(key: key);

  final AppointmentModel appointment;

  @override
  Widget build(BuildContext context) {
    int id = appointment.appId;
    String title = appointment.title;
    String time = appointment.time;
    String date = appointment.date;
    String status = appointment.status;
    Color statusColor = Colors.yellow.shade600;
    if (status == 'Accepted' || status == 'Completed') {
      statusColor = Colors.green.shade600;
    }
    if (status == 'Declined') {
      statusColor = Colors.red.shade600;
    }
    final trueDate = DateFormat('EEEE, MMMM d, y').format(DateTime.now());
    bool today = true;
    if (trueDate != date && date != 'Any Day') {
      today = false;
      DateTime parse = DateFormat('EEEE, MMMM d, y').parse(date);
      date = DateFormat('MMMM d').format(parse);
    }
    final load = Get.put(RefreshState());
    // ignore: unused_local_variable
    int read = load.read;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AppointView(
                appId: id,
                title: title,
                time: time,
                date: date,
                status: status,
                statusColor: statusColor,
              ),
            ),
          );
          if (i == 0) {
            Get.showSnackbar(
              const GetSnackBar(
                message: 'Failed to retrieve Appointment Status',
                borderRadius: 15,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                duration: Duration(seconds: 3),
              ),
            );
          }
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 3,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 2, color: Colors.transparent),
                    ),
                    child: const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/images/logo.png'),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        letterSpacing: 1,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      today ? 'Today, $time' : '$date, $time',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
