import 'package:flutter/material.dart';

class AppointView extends StatelessWidget {
  const AppointView({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_circle_left_outlined),
                  ),
                  const Text(
                    'Appointment Details',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.output_outlined),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
