import '../models/appointment_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:medical_app/backend/create_appointment.dart';

List appointmentList = [];

List<AppointmentModel> displayList = [];

// reference our box
var box = Hive.box('Box');

// id
int id = 0;

void storeId() {
  box.put("ID", id);
}

void getID() {
  id = box.get("ID");
}

void storeData() {
  box.put("APPOINTMENTLIST", appointmentList);
}

void loadData() {
  appointmentList = box.get("APPOINTMENTLIST");
}

// update the database
void saveData({
  required title,
  required time,
  required date,
  required intColor,
}) {
  // get id
  if (box.get("ID") != null) {
    getID();
  } else {
    appointmentList.clear();
  }

  AppointmentModel appointment = AppointmentModel(
    appId: ++id,
    title: title,
    time: time,
    date: date,
    intColor: intColor,
  );
  appointmentList.add(appointment);

  // Local Storage
  storeId();
  storeData();

  // Cloud Storage
  createAppointment(
    appId: appointment.appId,
    title: appointment.title,
    time: appointment.time,
    date: appointment.date,
    intColor: appointment.intColor,
  );
}
