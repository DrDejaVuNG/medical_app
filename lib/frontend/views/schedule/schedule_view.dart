import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import '../appointment/new_appointment.dart';
import '../../../databases/appointment_db.dart';
import 'package:medical_app/config/constants.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:medical_app/models/appointment_model.dart';
import 'package:medical_app/frontend/views/schedule/widgets/schedule.dart';

class ScheduleView extends StatefulWidget {
  const ScheduleView({super.key});

  @override
  State<ScheduleView> createState() => _ScheduleViewState();
}

class _ScheduleViewState extends State<ScheduleView> {
  CalendarFormat calendarFormat = CalendarFormat.week;
  DateTime today = DateTime.now();

  @override
  void initState() {
    super.initState();
    final date = DateFormat('EEEE, MMMM d, y').format(today);
    if (box.get("APPOINTMENTLIST") == null) {
      appointmentList.add(
        AppointmentModel(
          title: 'New appointment',
          time: 'Any time',
          date: date,
          intColor: 0xff33691e,
        ),
      );
    } else {
      loadData();
    }

    for (var appointment in appointmentList) {
      if (appointment.date == date) {
        displayList.add(appointment);
      }
    }
  }

  void onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
      displayList.clear();
      final date = DateFormat('EEEE, MMMM d, y').format(day);
      for (var appointment in appointmentList) {
        if (appointment.date == date) {
          displayList.add(appointment);
        }
      }
    });
  }

  void resetCalendar() {
    setState(() {
      today = DateTime.now();
      displayList.clear();
      final date = DateFormat('EEEE, MMMM d, y').format(today);
      for (var appointment in appointmentList) {
        if (appointment.date == date) {
          displayList.add(appointment);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            children: [
              // topbar
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
                  padding: const EdgeInsets.all(10),
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
                          ).then((value) => setState(() {
                                displayList.clear();
                                final date =
                                    DateFormat('EEEE, MMMM d, y').format(today);
                                for (var appointment in appointmentList) {
                                  if (appointment.date == date) {
                                    displayList.add(appointment);
                                  }
                                }
                              }));
                        },
                        child: const Icon(Icons.add),
                      ),
                    ],
                  ),
                ),
              ),

              // calendar widget
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: TableCalendar(
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
              ),

              // appointments list
              ListView.builder(
                itemCount: displayList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final item = displayList[index];
                  return ScheduleItem(item);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
