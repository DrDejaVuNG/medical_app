import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  const TextInput({
    Key? key,
    this.inputType,
    required this.text,
    required this.icon,
  }) : super(key: key);

  final String text;
  final Widget icon;
  final TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: size.height * 0.07,
      width: size.width * 0.9,
      child: TextField(
        keyboardType: inputType,
        decoration: InputDecoration(
          icon: icon,
          hintText: text,
        ),
      ),
    );
  }
}
