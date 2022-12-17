import 'package:flutter/material.dart';
import '../../appointment/view_appointment.dart';
import 'package:medical_app/config/constants.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AppointView()),
          );
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 3, color: Colors.white54),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 2, color: Colors.transparent),
                    ),
                    child: const CircleAvatar(
                      radius: 30,
                      backgroundImage:
                          AssetImage('assets/images/doctor_img.jpg'),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Dr. Dylan Cooper',
                      style: TextStyle(
                        letterSpacing: 1,
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Today, 09:00 AM',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
