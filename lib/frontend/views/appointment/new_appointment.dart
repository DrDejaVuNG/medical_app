import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medical_app/config/constants.dart';
import 'package:medical_app/databases/appointment_db.dart';
import 'package:medical_app/models/appointment_model.dart';
import 'package:o_color_picker/o_color_picker.dart';
import 'package:o_popup/o_popup.dart';

class AppointNew extends StatefulWidget {
  const AppointNew({super.key});
  @override
  State<AppointNew> createState() => _AppointNewState();
}

class _AppointNewState extends State<AppointNew> {
  AppointmentDB db = AppointmentDB();

  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();
  String? trueDate;
  String? trueTime;
  String? title;
  Color selectedColor = const Color(0xff33691e);

  // change color
  onColorChange(color) {
    setState(() {
      selectedColor = color;
    });
    Navigator.pop(context);
  }

  // change time
  timeSelection(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != TimeOfDay.now()) {
      setState(() {
        time = picked;
        final local = MaterialLocalizations.of(context);
        final timeFormat = local.formatTimeOfDay(time);
        trueTime = timeFormat;
      });
    }
  }

  // change date
  dateSelection(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.utc(2020),
      lastDate: DateTime.utc(2040),
    );
    if (picked != null && picked != DateTime.now()) {
      setState(() {
        date = picked;
        final dateFormat = DateFormat('EEEE, MMMM d, y').format(date);
        trueDate = dateFormat;
      });
    }
  }

  // save new appointment
  void saveNewTask() {
    AppointmentModel appointment = AppointmentModel(
      title: title.toString(),
      time: trueTime.toString(),
      date: trueDate.toString(),
      intColor: selectedColor.value,
    );
    setState(() {
      appointmentList.add(appointment);
    });
    db.updateDataBase();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back_rounded),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () => saveNewTask(),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Text(
                        'Add',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
                padding: const EdgeInsets.only(left: 45),
                child: TextFormField(
                  style: const TextStyle(fontSize: 22),
                  decoration: const InputDecoration(
                    hintText: 'Add a title',
                    border: InputBorder.none,
                  ),
                  validator: (value) {
                    if (value == null) {
                      return 'Add a title';
                    }
                    return null;
                  },
                  onChanged: (value) => title = value,
                ),
              ),
              const SizedBox(height: 10),
              OPopupTrigger(
                barrierAnimationDuration: const Duration(milliseconds: 200),
                triggerWidget: Container(
                  height: 65,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey.shade300),
                    ),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 2),
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          color: selectedColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: const Text(
                          'Pick a color',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
                popupContent: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OColorPicker(
                        selectedColor: selectedColor,
                        onColorChange: onColorChange,
                      ),
                    ]),
              ),
              GestureDetector(
                onTap: () => timeSelection(context),
                child: Container(
                  height: 65,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey.shade300),
                    ),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.schedule,
                        size: 23,
                      ),
                      const SizedBox(width: 20),
                      Text(
                        trueTime == null ? 'Pick a time' : trueTime.toString(),
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => dateSelection(context),
                child: Container(
                  height: 65,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey.shade300),
                    ),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.calendar_today_outlined,
                        size: 23,
                      ),
                      const SizedBox(width: 20),
                      Text(
                        trueDate == null ? 'Pick a date' : trueDate.toString(),
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
