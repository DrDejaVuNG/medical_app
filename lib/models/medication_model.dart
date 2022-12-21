import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

@HiveType(typeId: 0, adapterName: 'Medication')
class MedicationModel {
  MedicationModel({
    required this.name,
    required this.time,
    required this.prescription,
  });

  @HiveField(0)
  final id = uuid.v1();

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String time;

  @HiveField(3)
  final String prescription;
}

MedicationModel model = MedicationModel(
  name: 'name',
  time: 'time',
  prescription: 'prescription',
);
