import 'package:hive/hive.dart';

part 'medication_model.g.dart';

@HiveType(typeId: 1)
class MedicationModel {
  MedicationModel({
    required this.name,
    required this.time,
    required this.prescription,
  });

  @HiveField(0)
  final String name;

  @HiveField(1)
  final String time;

  @HiveField(2)
  final String prescription;
}
