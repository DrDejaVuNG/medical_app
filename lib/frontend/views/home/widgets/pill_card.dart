import 'pill_button.dart';
import 'package:flutter/material.dart';
import '../../../../config/constants.dart';

class PillCard extends StatelessWidget {
  const PillCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Container(
        width: 150,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.medication_outlined),
              ),
              SizedBox(height: 20),
              Text(
                'Aspirin',
                style: TextStyle(
                    fontSize: 17,
                    letterSpacing: 0.8,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 5),
              Text(
                '1 Pill, 25 Mg.',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 5),
              Text(
                '10:00 PM',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 20),
              PillButton(),
            ],
          ),
        ),
      ),
    );
  }
}
