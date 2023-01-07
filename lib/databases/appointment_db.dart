import '../models/appointment_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

List<AppointmentModel> appointmentList = [];

List<AppointmentModel> displayList = [];

// reference our box
var box = Hive.box('mybox');

// load the data from database
void loadData() {
  appointmentList = box.get("APPOINTMENTLIST");
}

// update the database
void updateDataBase() {
  box.put("APPOINTMENTLIST", appointmentList);
}
