import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medical_app/databases/appointment_db.dart';

class AppointNew extends StatefulWidget {
  const AppointNew({super.key});
  @override
  State<AppointNew> createState() => _AppointNewState();
}

class _AppointNewState extends State<AppointNew> {
  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();
  String? trueDate;
  String? trueTime;
  String? title;

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
  void saveAppointment() {
    if (title != null && trueTime != null) {
      if (trueDate != null) {
        saveData(
          title: title.toString(),
          time: trueTime.toString(),
          date: trueDate.toString(),
        );
        Navigator.of(context).pop();
      }
    }
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
                    onTap: () => saveAppointment(),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Text(
                        'Add',
                        style: TextStyle(
                          fontSize: 15,
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
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
                padding: const EdgeInsets.only(left: 40),
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
