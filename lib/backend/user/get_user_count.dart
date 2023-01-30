import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

final CollectionReference userRef =
    FirebaseFirestore.instance.collection('users');

Future getUserCount() async {
  int userCount = 0;
  try {
    // Get data from Firestore
    final QuerySnapshot snapshot = await userRef.get();
    // ignore: unused_local_variable
    for (var doc in snapshot.docs) {
      ++userCount;
    }
    return userCount;
  } catch (e) {
    rethrow;
  }
}
