import 'package:flutter/material.dart';
import '../models/appointment_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

  final _myBox = Hive.box('mybox');
List<AppointmentModel> appointmentList = [
  AppointmentModel(
    title: 'New appointment',
    time: 'Any time',
    date: 'Thursday, January 5, 2023',
    selectedColor: Colors.black,
  ),
];

class AppointmentDB {
  // reference our box

  // run this method if this is the 1st time ever opening this app
  void createInitialData() {
    appointmentList = [
      AppointmentModel(
        title: 'New appointment',
        time: 'Any time',
        date: 'Any Date',
        selectedColor: Colors.black,
      ),
    ];
  }

  // load the data from database
  void loadData() {
    appointmentList = _myBox.get("APPOINTMENTLIST");
  }

  // update the database
  Future<void> updateDataBase() async {
    await _myBox.put("APPOINTMENTLIST", appointmentList);
  }
}
