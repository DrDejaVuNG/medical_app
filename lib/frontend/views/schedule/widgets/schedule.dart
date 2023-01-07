import 'package:flutter/material.dart';
import 'package:medical_app/models/appointment_model.dart';
import '../../appointment/view_appointment.dart';
import 'package:medical_app/config/constants.dart';

class Schedule extends StatelessWidget {
  const Schedule({
    Key? key,
    required this.title,
    required this.time,
    required this.date,
    required this.color,
  }) : super(key: key);

  final String title;
  final String time;
  final String date;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              const SizedBox(height: 25),
              Text(
                time,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AppointView(
                    title: title,
                    time: time,
                    color: color,
                    date: date,
                  ),
                ),
              );
            },
            child: Stack(
              children: [
                Container(
                  height: 120,
                  width: MediaQuery.of(context).size.width * 0.675,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                Container(
                  height: 120,
                  margin: const EdgeInsets.only(bottom: 20),
                  width: MediaQuery.of(context).size.width * 0.65,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CircleAvatar(
                            radius: 20,
                            backgroundImage:
                                AssetImage('assets/images/doctor_img.jpg'),
                          ),
                          const SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              SizedBox(height: 5),
                              Text(
                                'Dr Dylan Cooper',
                                style: TextStyle(
                                  letterSpacing: 1,
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'General & Internal Medicine',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ScheduleItem extends Schedule {
  ScheduleItem(AppointmentModel item, {super.key})
      : super(
          title: item.title,
          time: item.time,
          date: item.date,
          color: item.selectedColor,
        );
}
