import 'appointment_db.dart';
import 'package:medical_app/models/medication_model.dart';

List pillList = [];

void storeMed() {
  box.put('PILLLIST', pillList);
}

void getMed() {
  if (box.get('PILLLIST') != null) {
    pillList = box.get('PILLLIST');
  }
}

void pillAdd({
  required drugName,
  required prescription,
  required time,
}) {
  MedicationModel pill = MedicationModel(
    name: drugName,
    time: time,
    prescription: prescription,
  );

  pillList.add(pill);
  storeMed();
}
