import 'package:budget/constants/theme.dart';
import 'package:budget/pages/auth/custom_auth_app_bar.dart';
import 'package:budget/pages/auth/login/login.dart';
import 'package:budget/pages/auth/signup/component/email_field.dart';
import 'package:budget/pages/auth/signup/component/password_field.dart';
import 'package:budget/pages/auth/signup/component/username_field.dart';
import 'package:budget/services/auth_service.dart';
import 'package:budget/shared/rounded_button.dart';
import 'package:flutter/material.dart';

import '../../../shared/nice_clipper.dart';
import '../../app/app_container.dart';

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

  void goToApp() {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
      builder: ((context) {
        return const AppContainer(title: 'Budget');
      }),
    ), (route) => false);
  }

  signup() async {
    if (isFormValid()) {
      await registerNewUser();
      goToApp();
      //Sign up
    }
  }

  isFormValid() {
    return formKey.currentState?.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAuthAppBar(),
      body: ListView(
        children: [
          ClipPath(
            clipper: NiceClipper(),
            child: Container(
              height: 200,
              width: double.infinity,
              color: AppTheme.statusBarColor,
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
                        color: AppTheme.primaryButtonColor,
                        text: 'Sign up',
                        press: signup),
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
    );
  }
}
