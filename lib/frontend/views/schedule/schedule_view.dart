import 'widgets/schedule.dart';
import 'package:flutter/material.dart';
import '../appointment/new_appointment.dart';
import 'package:medical_app/config/constants.dart';
import 'package:table_calendar/table_calendar.dart';

class ScheduleView extends StatefulWidget {
  const ScheduleView({super.key});

  @override
  State<ScheduleView> createState() => _ScheduleViewState();
}

class _ScheduleViewState extends State<ScheduleView> {
  CalendarFormat calendarFormat = CalendarFormat.week;
  DateTime today = DateTime.now();
  void onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  void resetCalendar() {
    setState(() {
      today = DateTime.now();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(
                      color: kPrimaryColor,
                      width: 2,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 15,
                        backgroundImage:
                            AssetImage('assets/images/doctor_img.jpg'),
                      ),
                      const SizedBox(width: 25),
                      const Text(
                        'Schedule',
                        style: TextStyle(
                          fontSize: 20,
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          resetCalendar();
                        },
                        child: const Icon(Icons.today),
                      ),
                      const SizedBox(width: 15),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AppointNew(),
                            ),
                          );
                        },
                        child: const Icon(Icons.add),
                      ),
                    ],
                  ),
                ),
              ),
              TableCalendar(
                focusedDay: today,
                firstDay: DateTime.utc(2020),
                lastDay: DateTime.utc(2040),
                calendarFormat: calendarFormat,
                headerStyle: const HeaderStyle(
                  titleCentered: true,
                  formatButtonVisible: false,
                ),
                calendarStyle: const CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: kLightColor,
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: kPrimaryColor,
                    shape: BoxShape.circle,
                  ),
                ),
                selectedDayPredicate: (day) => isSameDay(day, today),
                onDaySelected: onDaySelected,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: const [
                    Schedule(),
                    SizedBox(height: 20),
                    Schedule(),
                    SizedBox(height: 20),
                    Schedule(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
