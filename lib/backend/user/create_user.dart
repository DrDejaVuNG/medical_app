import 'package:intl/intl.dart';
import '../../databases/user_db.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medical_app/models/user_model.dart';

final trueTime = DateFormat('jm').format(DateTime.now());
final trueDate = DateFormat('MMMM d, y').format(DateTime.now());

Future createUser({
  String age = '-',
  String weight = '-kg',
  String bloodType = '-',
  required String name,
  required String email,
  required String mobile,
}) async {
  // Reference to document
  final docUser =
      FirebaseFirestore.instance.collection('users').doc(userTotal.toString());

  final newUser = UserModel(
    name: name,
    age: age,
    email: email,
    weight: weight,
    time: trueTime,
    date: trueDate,
    mobile: mobile,
    bloodType: bloodType,
    userId: userTotal,
  );
  user = newUser;
  userId = userTotal;
  storeUser(newUser);
  final json = newUser.toJson();

  // Create document and write data to Firebase
  await docUser.set(json);
}
