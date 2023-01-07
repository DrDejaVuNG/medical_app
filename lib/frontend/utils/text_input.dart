import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  const TextInput({
    Key? key,
    this.value,
    this.inputType,
    required this.icon,
    required this.text,
    required this.controller,
  }) : super(key: key);

  final String text;
  final Widget icon;
  final String? value;
  final TextInputType? inputType;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      height: size.height * 0.07,
      width: size.width * 0.9,
      child: TextFormField(
        controller: controller,
        initialValue: value,
        keyboardType: inputType,
        decoration: InputDecoration(
          icon: icon,
          hintText: text,
        ),
      ),
    );
  }
}
