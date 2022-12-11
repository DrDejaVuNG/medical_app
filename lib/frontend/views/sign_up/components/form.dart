import 'package:flutter/material.dart';
import 'package:medical_app/frontend/utils/text_input.dart';

import '../../../utils/password_input.dart';

class FormWidget extends StatelessWidget {
  const FormWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Sign up',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextInput(
            text: 'Email ID',
            icon: Icon(Icons.alternate_email),
            inputType: TextInputType.emailAddress,
          ),
          TextInput(
            text: 'Full Name',
            icon: Icon(Icons.person_outline),
            inputType: TextInputType.name,
          ),
          TextInput(
            text: 'Mobile',
            icon: Icon(Icons.phone_iphone_outlined),
            inputType: TextInputType.phone,
          ),
          PasswordInput(),
        ],
      ),
    );
  }
}
