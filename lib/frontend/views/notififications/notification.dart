import 'package:flutter/material.dart';
import 'package:medical_app/models/notification_model.dart';

class Notification extends StatelessWidget {
  const Notification({
    Key? key,
    required this.title,
    required this.time,
    required this.date,
    required this.description,
  }) : super(key: key);

  final String title;

  final String time;

  final String date;

  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: const TextStyle(fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                time,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                date,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class NotificationItem extends Notification {
  NotificationItem(NotificationModel item, {super.key})
      : super(
          title: item.title,
          time: item.time,
          date: item.date,
          description: item.description,
        );
}
