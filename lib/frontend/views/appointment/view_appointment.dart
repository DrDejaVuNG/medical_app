import 'package:flutter/material.dart';
import 'package:medical_app/backend/appointment/update_appointment.dart';

class AppointView extends StatelessWidget {
  const AppointView({
    super.key,
    required this.appId,
    required this.title,
    required this.time,
    required this.date,
    required this.status,
    required this.statusColor,
  });

  final int appId;
  final String title;
  final String time;
  final String date;
  final String status;
  final Color statusColor;

  void cancel(context) {
    if (status != 'Cancelled' && status != 'Completed') {
      updateAppointment('$appId', 'Cancelled');
    }
    Navigator.pop(context);
  }

  void markDone(context) {
    if (status != 'Completed' && status != 'Cancelled') {
      updateAppointment('$appId', 'Completed');
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const BackButton(),
                    const Text(
                      'Appointment Details',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    PopupMenuButton<MenuItems>(
                      itemBuilder: (context) => [
                        const PopupMenuItem(
                          value: MenuItems.cancel,
                          child: Text('Cancel Appointment'),
                        ),
                        const PopupMenuItem(
                          value: MenuItems.done,
                          child: Text('Mark As Done'),
                        ),
                      ],
                      onSelected: (value) {
                        switch (value) {
                          case MenuItems.cancel:
                            cancel(context);
                            break;
                          case MenuItems.done:
                            markDone(context);
                            break;
                          default:
                        }
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset('assets/images/logo.png', scale: 6),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Lagos State University',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  'Status: $status',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const SizedBox(width: 2),
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              color: statusColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              title,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          const Icon(Icons.date_range_outlined),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                date,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 3),
                              const Text(
                                'Due date',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                      Row(
                        children: [
                          const Icon(Icons.schedule),
                          const SizedBox(width: 10),
                          Text(
                            time,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                      Row(
                        children: [
                          const SizedBox(width: 7),
                          Container(
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                              color: statusColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            status,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
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
        ),
      ),
    );
  }
}

enum MenuItems {
  cancel,
  done,
}
