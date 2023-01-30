import 'package:medical_app/config/constants.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    this.border,
    required this.widget,
    required this.width,
    required this.action,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  final Widget widget;
  final double width;
  final BoxBorder? border;
  final void Function() action;
  final Color color, textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: width,
      decoration: BoxDecoration(
        border: border,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 30,
            ),
            foregroundColor: textColor,
            backgroundColor: color,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        onPressed: action,
        child: widget,
      ),
    );
  }
}
