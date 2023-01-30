import 'package:medical_app/databases/user_db.dart';
import 'package:medical_app/databases/medication_db.dart';
import 'package:medical_app/databases/appointment_db.dart';
import 'package:medical_app/models/appointment_model.dart';
import 'package:medical_app/databases/notification_db.dart';
import 'package:medical_app/backend/user/get_user_count.dart';
import 'package:medical_app/backend/appointment/get_appointments.dart';

void configuration() async {
  // User Data
  getUser();

  // Local Appointments
  if (box.get("APPOINTMENTLIST") != null) {
    loadData();
  } else {
    appointmentList.add(AppointmentModel(
      appId: id,
      title: 'New Appointment',
      time: 'Any Time',
      date: 'Any Day',
      userId: userId,
    ));
  }

  // Medication
  getMed();

  // Notification
  getNotifications();

  // Cloud Appointments
  getAppointments().then((items) {
    appointmentData = items;
    if (appointmentData.isNotEmpty) {
      rewriteAppointment();
    }
  }).catchError((error) {});

  // User Count
  getUserCount().then((userCount) {
    if (userCount != null) {
      userTotal = ++userCount;
    }
  }).catchError((error) {});
}
