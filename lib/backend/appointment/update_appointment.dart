import 'package:cloud_firestore/cloud_firestore.dart';

void updateAppointment(id, status) {
  final docAppointment =
      FirebaseFirestore.instance.collection('appointments').doc(id);
  docAppointment.update({
    'status': status,
  });
}
