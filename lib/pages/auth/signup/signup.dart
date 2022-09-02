import 'package:budget/pages/auth/login/login.dart';
import 'package:budget/pages/auth/signup/component/email_field.dart';
import 'package:budget/pages/auth/signup/component/password_field.dart';
import 'package:budget/pages/auth/signup/component/username_field.dart';
import 'package:budget/shared/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../shared/nice_clipper.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String _username = '';
  String _email = '';
  String _password = '';
  String _reWritePassword = '';
  final formKey = GlobalKey<FormState>();

  void onUsernameChanged(String? username) {
    setState(() {
      _username = username ?? '';
    });
  }

  void onEmailChanged(String? email) {
    setState(() {
      _email = email ?? '';
    });
  }

  void onPasswordChanged(String? password) {
    setState(() {
      _password = password ?? '';
    });
  }

  void onReWritePasswordChanged(String? reWritePassword) {
    setState(() {
      _reWritePassword = reWritePassword ?? '';
    });
  }

  signup() {
    if (isFormValid()) {
      //Sign up
    }
  }

  isFormValid() {
    return formKey.currentState?.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: ListView(
          children: [
            ClipPath(
              clipper: NiceClipper(),
              child: Container(
                height: 200,
                width: double.infinity,
                color: Colors.indigo[400],
                child: const Center(
                  child: Text(
                    'Create your account',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Form(
              key: formKey,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: Center(
                  child: Column(
                    children: [
                      UsernameField(
                        handleUsernameChange: onUsernameChanged,
                      ),
                      EmailField(
                        handleEmailChange: onEmailChanged,
                      ),
                      PasswordField(
                        handlePasswordChange: onPasswordChanged,
                        handleReWritePasswordChange: onReWritePasswordChanged,
                      ),
                      RoundedButtom(
                          color: Colors.indigo, text: 'Sign up', press: signup),
                      TextButton(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(context,
                                MaterialPageRoute(
                              builder: (context) {
                                return const Login();
                              },
                            ), (route) => false);
                          },
                          child: const Text('Alredy have an account? Log in!')),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
