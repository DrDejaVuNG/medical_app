import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medical_app/config/constants.dart';
import 'package:o_color_picker/o_color_picker.dart';
import 'package:o_popup/o_popup.dart';

class AppointNew extends StatefulWidget {
  const AppointNew({super.key});

  @override
  State<AppointNew> createState() => _AppointNewState();
}

class _AppointNewState extends State<AppointNew> {
  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();
  TimeOfDay? trueTime;
  DateTime? trueDate;

  
  Color selectedColor = kPrimaryColor;
  onColorChange(color) {
    setState(() {
      selectedColor = color;
    });
    Navigator.pop(context);
  }

  timeSelection(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != TimeOfDay.now()) {
      setState(() {
        time = picked;
        trueTime = picked;
      });
    }
  }

  dateSelection(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.utc(2020),
      lastDate: DateTime.utc(2040),
    );
    if (picked != null) {
      setState(() {
        date = picked;
        trueDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final local = MaterialLocalizations.of(context);
    final timeFormat = local.formatTimeOfDay(time);
    final dateFormat = DateFormat('EEEE, MMMM d, y').format(date);
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
                    onTap: () {
                      Navigator.pop(context);
                    },
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
              Padding(
                padding: const EdgeInsets.only(left: 45),
                child: TextFormField(
                  style: const TextStyle(fontSize: 22),
                  decoration: const InputDecoration(
                    hintText: 'Add a title',
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
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
                  OPopupTrigger(
                    barrierAnimationDuration: const Duration(milliseconds: 200),
                    triggerWidget: Container(
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        'Pick a color',
                        style: TextStyle(fontSize: 16),
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
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Icon(
                    Icons.schedule,
                    size: 23,
                  ),
                  const SizedBox(width: 20),
                  GestureDetector(
                    onTap: () => timeSelection(context),
                    child: Text(
                      trueTime == null ? 'Pick a time' : timeFormat,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Icon(
                    Icons.calendar_today_outlined,
                    size: 23,
                  ),
                  const SizedBox(width: 20),
                  GestureDetector(
                    onTap: () => dateSelection(context),
                    child: Text(
                      trueDate == null ? 'Pick a date' : dateFormat,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}