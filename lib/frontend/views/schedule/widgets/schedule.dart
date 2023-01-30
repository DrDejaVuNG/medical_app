import 'package:flutter/material.dart';
import 'package:medical_app/models/appointment_model.dart';
import '../../appointment/view_appointment.dart';

class Schedule extends StatelessWidget {
  const Schedule({
    Key? key,
    required this.id,
    required this.title,
    required this.time,
    required this.date,
    required this.status,
  }) : super(key: key);

  final int id;
  final String title;
  final String time;
  final String date;
  final String status;

  @override
  Widget build(BuildContext context) {
    Color statusColor = Colors.yellow.shade600;
    if (status == 'Accepted' || status == 'Completed') {
      statusColor = Colors.green.shade600;
    }
    if (status == 'Declined') {
      statusColor = Colors.red.shade600;
    }
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              const SizedBox(height: 25),
              Text(
                time,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Spacer(),
          GestureDetector(
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
            child: Stack(
              children: [
                Container(
                  height: 120,
                  width: MediaQuery.of(context).size.width * 0.675,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: statusColor,
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                Container(
                  height: 120,
                  margin: const EdgeInsets.only(bottom: 20),
                  width: MediaQuery.of(context).size.width * 0.65,
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
                            backgroundImage:
                                AssetImage('assets/images/logo.png'),
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
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
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
        ],
      ),
    );
  }
}

class ScheduleItem extends Schedule {
  ScheduleItem(AppointmentModel item, {super.key})
      : super(
          id: item.appId,
          title: item.title,
          time: item.time,
          date: item.date,
          status: item.status.toString(),
        );
}
