import 'package:flutter/material.dart';

class Greeting extends StatelessWidget {
  const Greeting({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final local = MaterialLocalizations.of(context);
    final time = local.formatTimeOfDay(TimeOfDay.now());
    bool timeOfDay = true;
    if (time.contains('PM')) {
      timeOfDay = false;
    }
    return Expanded(
      child: Text(
        timeOfDay ? 'Good Morning, Paul' : 'Good Day, Paul',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
      ),
    );
  }
}
