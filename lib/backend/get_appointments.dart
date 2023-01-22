import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medical_app/databases/notification_db.dart';
import 'package:medical_app/models/appointment_model.dart';

final CollectionReference appointmentRef =
    FirebaseFirestore.instance.collection('appointments');
List<AppointmentModel> appointmentData = [];


Future getAppointments() async {
  await appointmentRef.snapshots().map((snapshot) {
    final items = snapshot.docs
        .map((doc) =>
            AppointmentModel.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
    appointmentData = items;
  }).first;

  // // Create Notifications
  if (appointmentData.isNotEmpty) {
    appNotification();
  }
}
