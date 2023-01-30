import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medical_app/models/appointment_model.dart';

final CollectionReference appointmentRef =
    FirebaseFirestore.instance.collection('appointments');
List<AppointmentModel> appointmentData = [];

Future getAppointments() async {
  List<AppointmentModel> items = [];
  try {
    // Get data from Firestore
    final QuerySnapshot snapshot = await appointmentRef.get();

    // Convert data to list of Item objects
    for (var doc in snapshot.docs) {
      final item =
          AppointmentModel.fromJson(doc.data() as Map<String, dynamic>);
      items.add(item);
    }
    return items;
  } catch (e) {
    rethrow;
  }
  // Short Version
  // await appointmentRef.snapshots().map((snapshot) {
  //   final items = snapshot.docs
  //       .map((doc) =>
  //           AppointmentModel.fromJson(doc.data() as Map<String, dynamic>))
  //       .toList();
  //   return items;
  // }).first;
}
