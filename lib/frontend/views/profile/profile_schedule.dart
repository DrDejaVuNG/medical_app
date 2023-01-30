import 'package:flutter/material.dart';
import 'package:medical_app/frontend/views/appointment/view_appointment.dart';
import 'package:medical_app/models/appointment_model.dart';

class ProfileSchedule extends StatelessWidget {
  const ProfileSchedule({super.key, required this.appointment});

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
    return GestureDetector(
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
      },
      child: Center(
        child: Stack(
          children: [
            Container(
              height: 120,
              margin: const EdgeInsets.only(bottom: 20),
              width: MediaQuery.of(context).size.width * 0.9,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: statusColor,
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            Container(
              height: 120,
              width: MediaQuery.of(context).size.width * 0.875,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage('assets/images/logo.png'),
                      ),
                      const SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 5),
                          Text(
                            title,
                            style: TextStyle(
                              letterSpacing: 1,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Lagos State University',
                            style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const SizedBox(width: 5),
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          color: statusColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        status,
                        style: TextStyle(
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
