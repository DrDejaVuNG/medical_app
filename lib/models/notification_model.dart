import 'package:hive/hive.dart';

part 'notification_model.g.dart';

@HiveType(typeId: 2)
class NotificationModel {
  NotificationModel({
    this.id,
    required this.title,
    required this.time,
    required this.date,
    required this.description,
  });

  @HiveField(0)
  int? id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String time;

  @HiveField(3)
  final String date;

  @HiveField(4)
  final String description;
}
