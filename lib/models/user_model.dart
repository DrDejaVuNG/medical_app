import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 3)
class UserModel {
  UserModel({
    this.age,
    this.time,
    this.date,
    this.email,
    this.weight,
    this.bloodType,
    required this.name,
    required this.mobile,
    required this.userId,
  });

  @HiveField(0)
  String name;

  @HiveField(1)
  String? email;

  @HiveField(2)
  String mobile;

  @HiveField(3)
  int userId;

  @HiveField(4)
  String? age;

  @HiveField(5)
  String? weight;

  @HiveField(6)
  String? bloodType;

  @HiveField(7)
  String? time;
  
  @HiveField(8)
  String? date;

  Map<String, dynamic> toJson() => {
        'age': age,
        'name': name,
        'time': time,
        'date': date,
        'email': email,
        'mobile': mobile,
        'userId': userId,
        'weight': weight,
        'bloodType': bloodType,
      };
}
