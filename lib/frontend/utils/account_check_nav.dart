import 'package:flutter/material.dart';
import '../../config/constants.dart';

class AccountCheckNav extends StatelessWidget {
  const AccountCheckNav({
    Key? key,
    required this.firstText,
    required this.secondText,
    required this.action,
  }) : super(key: key);

  final String firstText;
  final String secondText;
  final Function() action;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          firstText,
          style: const TextStyle(color: kBackground),
        ),
        const SizedBox(width: 5),
        GestureDetector(
          onTap: action,
          child: Text(
            secondText,
            style: const TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

// could have just mad it an elevated button