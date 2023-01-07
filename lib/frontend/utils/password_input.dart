import 'package:flutter/material.dart';
import 'package:medical_app/providers/input_state.dart';
import 'package:provider/provider.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({
    Key? key,
    required this.type,
  }) : super(key: key);

  final String type;
  // void toggle() {
  //   obscureText = !obscureText;
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final state = Provider.of<InputState>(context);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      height: size.height * 0.07,
      width: size.width * 0.9,
      child: TextFormField(
        obscureText: true,
        keyboardType: TextInputType.visiblePassword,
        decoration: const InputDecoration(
          icon: Icon(Icons.lock_outlined),
          hintText: 'Password',
          // suffixIcon: IconButton(
          //   splashRadius: 1,
          //   onPressed: toggle,
          //   icon: Icon(
          //       obscureText ? Icons.visibility_sharp : Icons.visibility_off),
          // ),
        ),
        onChanged: (value) => state.setValue(value, type),
      ),
    );
  }
}
