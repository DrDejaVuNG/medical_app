import 'package:hive/hive.dart';

part 'appointment_model.g.dart';

@HiveType(typeId: 0)
class AppointmentModel {
  AppointmentModel({
    this.fID,
    required this.appId,
    required this.title,
    required this.time,
    required this.date,
    required this.userId,
    this.status = 'Pending',
  });

  @HiveField(0)
  int appId;

  @HiveField(1)
  String title;

  @HiveField(2)
  String time;

  @HiveField(3)
  String date;

  @HiveField(4)
  String status;

  @HiveField(5)
  String? fID;

  @HiveField(6)
  int userId;

  Map<String, dynamic> toJson() => {
        'id': appId,
        'fID': fID,
        'title': title,
        'time': time,
        'date': date,
        'status': status,
        'userId': userId,
      };

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      fID: json['fID'],
      appId: json['id'],
      title: json['title'],
      time: json['time'],
      date: json['date'],
      status: json['status'],
      userId: json['userId'],
    );
  }
}
