import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medical_app/databases/user_db.dart';
import 'package:medical_app/models/appointment_model.dart';

Future createAppointment({
  required String fID,
  required int appId,
  required String title,
  required String time,
  required String date,
}) async {
  // Reference to document
  final docAppointment =
      FirebaseFirestore.instance.collection('appointments').doc(fID);

  final appointment = AppointmentModel(
    fID: fID,
    appId: appId,
    title: title,
    time: time,
    date: date, 
    userId: userId,
  );
  final json = appointment.toJson();

  // Create document and write data to Firebase
  await docAppointment.set(json);
}
