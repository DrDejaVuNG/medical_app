import 'package:flutter/material.dart';
import 'package:medical_app/frontend/utils/password_input.dart';
import 'package:medical_app/frontend/utils/text_input.dart';

class FormWidget extends StatelessWidget {
  const FormWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Login',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          TextInput(
            icon: Icon(Icons.alternate_email),
            text: 'Email ID',
            inputType: TextInputType.emailAddress,
          ),
          PasswordInput(),
        ],
      ),
    );
  }
}
