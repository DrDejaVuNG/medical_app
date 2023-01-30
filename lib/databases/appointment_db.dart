import 'user_db.dart';
import 'package:get/get.dart';
import '../models/appointment_model.dart';
import 'package:medical_app/providers/refresh.dart';
import 'package:medical_app/databases/notification_db.dart';
import 'package:medical_app/backend/appointment/get_appointments.dart';
import 'package:medical_app/backend/appointment/create_appointment.dart';

final load = Get.put(RefreshState());

List appointmentList = [];

List<AppointmentModel> displayList = [];

void storeData() {
  box.put("APPOINTMENTLIST", appointmentList);
  load.refresh();
}

void loadData() {
  appointmentList = box.get("APPOINTMENTLIST");
}

// update the database
void saveData({
  required title,
  required time,
  required date,
}) {
  // get id
  if (box.get("ID") != null) {
    getID();
  } else {
    appointmentList.clear();
  }

  int appId = ++id;
  String fID = userId.toString() + appId.toString();
  AppointmentModel appointment = AppointmentModel(
    fID: fID,
    appId: appId,
    title: title,
    time: time,
    date: date,
    userId: userId,
  );
  appointmentList.add(appointment);

  // Local Storage
  storeId();
  storeData();

  // Cloud Storage
  createAppointment(
    fID: fID,
    appId: appointment.appId,
    title: appointment.title,
    time: appointment.time,
    date: appointment.date,
  );
}

void rewriteAppointment() {
  for (var appointment in appointmentData) {
    var status = appointment.status;
    if (status != 'Pending') {
      // Fetch Modified Appointment
      final index = appointmentList
          .indexWhere((element) => element.appId == appointment.appId);
      var indexStatus = appointmentList[index].status;

      // Replace Appointment
      if (indexStatus == 'Pending') {
        appointmentList[index] = appointment;
        storeData();

        // Create Notification
        appNotification(appointment);
      }
    }
  }
}
