import 'package:flutter/material.dart';

class PillButton extends StatefulWidget {
  const PillButton({
    Key? key,
  }) : super(key: key);

  @override
  State<PillButton> createState() => _PillButtonState();
}

class _PillButtonState extends State<PillButton> {
  bool clicked = false;

  void action() => setState(() => clicked = !clicked);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: TextButton(
          onPressed: action,
          style: TextButton.styleFrom(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(clicked ? 'Taken' : 'Take'),
        ),
      ),
    );
  }
}
