import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medical_app/models/appointment_model.dart';

Future createAppointment({
  required int appId,
  required String title,
  required String time,
  required String date,
  required int intColor,
}) async {
  // Reference to document
  final docAppointment =
      FirebaseFirestore.instance.collection('appointments').doc("$appId");

  final appointment = AppointmentModel(
    appId: appId,
    title: title,
    time: time,
    date: date,
    intColor: intColor,
  );
  final json = appointment.toJson();

  // Create document and write data to Firebase
  await docAppointment.set(json);
}
