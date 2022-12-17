import 'package:flutter/material.dart';
import 'package:medical_app/config/constants.dart';

class AppointNew extends StatelessWidget {
  const AppointNew({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    child: const Icon(Icons.arrow_back_rounded),
                  ),
                  const Spacer(),
                  Container(
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
            ],
          ),
        ),
      ),
    );
  }
}
