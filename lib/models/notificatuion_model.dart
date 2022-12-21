import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

@HiveType(typeId: 0, adapterName: 'Notification')
class NotificationModel {
  NotificationModel({
    required this.title,
    required this.time,
    required this.date,
    required this.description,
  });

  @HiveField(0)
  final id = uuid.v1();

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String time;

  @HiveField(3)
  final String date;

  @HiveField(4)
  final String description;
}

NotificationModel model = NotificationModel(
  title: 'title',
  time: 'time',
  date: 'date',
  description: 'description',
);
