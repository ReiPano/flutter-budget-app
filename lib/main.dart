import 'package:budget/pages/app/app_container.dart';
import 'package:budget/pages/welcome/welcome.dart';
import 'package:budget/service/auth_service.dart';
import 'package:budget/shared/loader.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BudgetApp());
}

class BudgetApp extends StatefulWidget {
  const BudgetApp({Key? key}) : super(key: key);

  @override
  State<BudgetApp> createState() => _BudgetAppState();
}

class _BudgetAppState extends State<BudgetApp> {
  String? token;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    initAppState();
  }

  initAppState() async {
    String? jwtToken = await getJWTAuthToken();
    if (jwtToken != null) {
      bool isValid = await verifyJWTToken(jwtToken);
      if (!isValid) {
        removeJWTAuthToken();
      }
    }
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        token = jwtToken ?? '123131';
        loading = false;
      });
    });
  }

  Widget getHomeComponent() {
    if (loading) {
      return const Loader(
        loadingText: 'Please wait while the app is loading the data...',
      );
    } else {
      if (token == null || token == '') {
        return const Welcome();
      } else {
        return const AppContainer(
          title: 'Budget',
        );
      }
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Budget',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: getHomeComponent(),
      // home: const AppContainer(title: 'Budget'),
    );
  }
}
