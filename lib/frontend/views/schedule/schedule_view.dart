import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import '../appointment/new_appointment.dart';
import '../../../databases/appointment_db.dart';
import 'package:table_calendar/table_calendar.dart';
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
    displayList.clear();
    final date = DateFormat('EEEE, MMMM d, y').format(today);
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
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
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
                  calendarStyle: CalendarStyle(
                    todayDecoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondaryContainer,
                      shape: BoxShape.circle,
                    ),
                    selectedDecoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AppointNew(),
            ),
          ).then(
            (value) => setState(() {
              displayList.clear();
              final date = DateFormat('EEEE, MMMM d, y').format(today);
              for (var appointment in appointmentList) {
                if (appointment.date == date) {
                  displayList.add(appointment);
                }
              }
            }),
          );
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        // backgroundColor: Colors.black87,
        child: const Icon(Icons.add),
      ),
    );
  }
}
