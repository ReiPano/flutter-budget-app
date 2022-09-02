import 'package:flutter/material.dart';

class EmailField extends StatefulWidget {
  const EmailField({Key? key, required this.handleEmailChange})
      : super(key: key);
  final ValueChanged<String?> handleEmailChange;

  @override
  State<EmailField> createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  final RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Email can\'t be empty';
    } else if (!emailRegex.hasMatch(email)) {
      return 'Email is not valid. Please write a valid email';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: TextFormField(
        onChanged: widget.handleEmailChange,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Email',
        ),
        validator: validateEmail,
      ),
    );
  }
}
