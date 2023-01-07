import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class NotificationModel {
  NotificationModel({
    required this.title,
    required this.time,
    required this.date,
    required this.description,
  });

  final id = uuid.v1();

  final String title;

  final String time;

  final String date;

  final String description;
}

NotificationModel model = NotificationModel(
  title: 'title',
  time: 'time',
  date: 'date',
  description: 'description',
);
