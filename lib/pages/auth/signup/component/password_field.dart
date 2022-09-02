import 'package:flutter/material.dart';

var _passwordEmptyError = 'Password can\'t be empty.';
var _passwordNotMatchError = 'Passwords did not match.';
var _passwordToShortError = 'Password must have at least 6 characters.';
var _passwordNotSecureError =
    'Password must have at least 1 special character.';
var passwordHasSpecialCharacters = RegExp("[^A-Za-z0-9]");

class PasswordField extends StatefulWidget {
  const PasswordField(
      {Key? key,
      required this.handlePasswordChange,
      required this.handleReWritePasswordChange})
      : super(key: key);
  final ValueChanged<String?> handlePasswordChange;
  final ValueChanged<String?> handleReWritePasswordChange;
  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  String pass1 = '';
  String pass2 = '';

  String? validatePassword1(String? value) {
    setState(() {
      pass1 = value ?? '';
    });
    if (value == null || value.isEmpty) {
      return _passwordEmptyError;
    } else if (value.length < 6) {
      return _passwordToShortError;
    } else if (!passwordHasSpecialCharacters.hasMatch(value)) {
      return _passwordNotSecureError;
    }
    return null;
  }

  String? validatePassword2(String? value) {
    setState(() {
      pass2 = value ?? '';
    });
    if (value == null || value.isEmpty) {
      return _passwordEmptyError;
    } else if (value.length < 6) {
      return _passwordToShortError;
    } else if (!passwordHasSpecialCharacters.hasMatch(value)) {
      return _passwordNotSecureError;
    } else if (value != pass1) {
      return _passwordNotMatchError;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20),
          child: TextFormField(
            onChanged: widget.handlePasswordChange,
            obscureText: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
            ),
            validator: validatePassword1,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 20, bottom: 40),
          child: TextFormField(
            onChanged: widget.handleReWritePasswordChange,
            obscureText: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Re-write Password',
            ),
            validator: validatePassword2,
          ),
        ),
      ],
    );
  }
}
