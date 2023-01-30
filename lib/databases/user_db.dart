import 'package:intl/intl.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:medical_app/models/user_model.dart';
import 'package:medical_app/backend/user/update_user.dart';

// reference our box
var box = Hive.box('Box');

final trueTime = DateFormat('jm').format(DateTime.now());
final trueDate = DateFormat('MMMM d').format(DateTime.now());

// id
int i = 1;
int id = 0;
int userId = 0;
int userTotal = 1;

void storeId() {
  box.put("ID", id);
}

void getID() {
  id = box.get("ID");
}

UserModel user = UserModel(
  age: '-',
  weight: '-kg',
  name: 'name',
  bloodType: '-',
  email: 'email',
  mobile: 'mobile',
  userId: userTotal,
);

void storeUser(user) {
  box.put("USER", user);
}

void getUser() {
  if (box.get("USER") != null) {
    user = box.get("USER");
    userId = user.userId;
  }
}

void saveUser(UserModel user) {
  updateUser(
    userId: userId,
    age: user.age,
    name: user.name,
    mobile: user.mobile,
    weight: user.weight,
    bloodType: user.bloodType,
  );
}
