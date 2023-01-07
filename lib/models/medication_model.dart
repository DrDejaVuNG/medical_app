import 'package:uuid/uuid.dart';

var uuid = const Uuid();
class MedicationModel {
  MedicationModel({
    required this.name,
    required this.time,
    required this.prescription,
  });

  final id = uuid.v1();

  final String name;

  final String time;

  final String prescription;
}

MedicationModel model = MedicationModel(
  name: 'name',
  time: 'time',
  prescription: 'prescription',
);
