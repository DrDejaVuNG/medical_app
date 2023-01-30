import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medical_app/databases/user_db.dart';
import 'package:medical_app/models/user_model.dart';

void updateUser({
  String? age,
  String? weight,
  String? bloodType,
  required int userId,
  required String name,
  required String mobile,
}) {
  // Reference to document
  final docUser =
      FirebaseFirestore.instance.collection('users').doc(userId.toString());

  final user = UserModel(
    age: age,
    name: name,
    mobile: mobile,
    userId: userId,
    weight: weight,
    bloodType: bloodType,
  );
  storeUser(user);
  final json = user.toJson();

  // Update document and write data to Firebase
  docUser.update(json);
}
