import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:uuid/uuid.dart';

part 'appointment_model.g.dart';

var uuid = const Uuid();

@HiveType(typeId: 0, adapterName: 'AppointmentAdapter')
class AppointmentModel {
  AppointmentModel({
    required this.title,
    required this.time,
    required this.date,
    required this.selectedColor,
  });

  @HiveField(0)
  final id = uuid.v1();


  @HiveField(1)
  final String title;


  @HiveField(2)
  final String time;


  @HiveField(3)
  final String date;


  @HiveField(4)
  final Color selectedColor;
}

AppointmentModel model = AppointmentModel(
  title: 'title',
  time: 'time',
  date: 'date',
  selectedColor: Colors.black,
);