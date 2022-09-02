import 'package:flutter/material.dart';

class UsernameField extends StatefulWidget {
  const UsernameField({Key? key, required this.handleUsernameChange})
      : super(key: key);
  final ValueChanged<String?> handleUsernameChange;

  @override
  State<UsernameField> createState() => _UsernameFieldState();
}

class _UsernameFieldState extends State<UsernameField> {
  String? validateUsername(String? username) {
    if (username == null || username.isEmpty) {
      return 'Username can\' be empty';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: TextFormField(
        onChanged: widget.handleUsernameChange,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Username',
        ),
        validator: validateUsername,
      ),
    );
  }
}
