import 'package:budget/constants/theme.dart';
import 'package:budget/pages/auth/login/login.dart';
import 'package:budget/pages/auth/signup/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../shared/rounded_button.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  var color = AppTheme.primaryColorShade;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 80),
              child: const Center(
                child: Text(
                  'Wellcome to budget',
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Image.asset(
              'assets/welcome_img.png',
              height: 400,
            ),
            RoundedButtom(
                color: AppTheme.primaryColor,
                text: 'Login',
                press: () {
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (context) {
                    return const Login();
                  }), (route) => false);
                }),
            RoundedButtom(
                color: color,
                text: 'Sign up',
                press: () {
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (context) {
                    return const Signup();
                  }), (route) => false);
                })
          ],
        ),
      ),
    );
  }
}
