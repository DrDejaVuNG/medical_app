import 'package:hive/hive.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// part 'user_model.g.dart';

@HiveType(typeId: 3)
class UserModel {
  UserModel({
    required this.name,
    required this.email,
    required this.mobile,
  });

  @HiveField(0)
  String name;

  @HiveField(1)
  String email;

  @HiveField(2)
  String mobile;

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'mobile': mobile,
  };
}

Future createUser({
    required String name,
    required String email,
    required String mobile,
  }) async {
    // Reference to document
    final docUser = FirebaseFirestore.instance.collection('users').doc();

    final user = UserModel(
      name: name,
      email: email,
      mobile: mobile,
    );
    final json = user.toJson();

    // Create document and write data to Firebase
    await docUser.set(json);
  }
