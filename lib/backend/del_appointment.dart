import 'package:cloud_firestore/cloud_firestore.dart';

void deleteAppointment() {
  final docAppointment =
      FirebaseFirestore.instance.collection('appointments').doc(/*id*/);
  docAppointment.delete();
}