import 'dart:developer';

import 'package:budget/constants/theme.dart';
import 'package:budget/pages/app/app_container.dart';
import 'package:budget/pages/auth/custom_auth_app_bar.dart';
import 'package:budget/pages/auth/signup/signup.dart';
import 'package:budget/services/auth_service.dart';
import 'package:budget/shared/rounded_button.dart';
import 'package:flutter/material.dart';
import '../../../shared/nice_clipper.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final usernameController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');
  bool usernameError = false;
  bool passwordError = false;

  void goToApp() {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
      builder: ((context) {
        return const AppContainer(title: 'Budget');
      }),
    ), (route) => false);
  }

  login() async {
    String username = usernameController.text;
    String password = usernameController.text;
    if (username.isEmpty) {
      setState(() {
        usernameError = true;
      });
    }
    if (password.isEmpty) {
      setState(() {
        passwordError = true;
      });
    }

    if (!usernameError && !passwordError) {
      // Call the login funtion
      bool success = await loginWithUsernameAndPassword(username, password);
      success
          ? goToApp()
          : () {
              log('Cannot login');
            };
    }
  }

  resetUsernameValidation(value) {
    setState(() {
      usernameError = false;
    });
  }

  resetPasswordValidation(value) {
    setState(() {
      passwordError = false;
    });
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
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
                  'Log in to your account',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            child: Center(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 40),
                    child: TextField(
                      controller: usernameController,
                      onChanged: resetUsernameValidation,
                      autocorrect: false,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Username',
                        errorText:
                            usernameError ? 'Username can\'t be empty' : null,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 40),
                    child: TextField(
                      controller: passwordController,
                      onChanged: resetPasswordValidation,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Password',
                        errorText:
                            passwordError ? 'Password can\'t be empty' : null,
                      ),
                    ),
                  ),
                  RoundedButtom(
                      color: AppTheme.primaryButtonColor,
                      text: 'Log in',
                      press: login),
                  TextButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                          builder: (context) {
                            return const Signup();
                          },
                        ), (route) => false);
                      },
                      child: const Text('Do not have an account? Sign up!')),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
