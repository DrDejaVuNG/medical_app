import 'package:medical_app/databases/medication_db.dart';
import 'package:medical_app/backend/get_appointments.dart';
import 'package:medical_app/databases/appointment_db.dart';
import 'package:medical_app/databases/notification_db.dart';
import 'package:medical_app/models/appointment_model.dart';

void loadMain() {
  // Local Appointments
  if (box.get("APPOINTMENTLIST") != null) {
    loadData();
  } else {
    appointmentList.add(AppointmentModel(
      appId: id,
      title: 'New Appointment',
      time: 'Any Time',
      date: 'Any Day',
      intColor: 0xff33691e,
    ));
  }

  // Medication
  getMed();

  // Notification
  getNotifications();

  // Cloud Appointments
  getAppointments();
}
