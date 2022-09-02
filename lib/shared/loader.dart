import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({Key? key, required this.loadingText}) : super(key: key);
  final String loadingText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(
              semanticsLabel: 'Circular progress indicator',
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Text(
                loadingText,
              ),
            )
          ],
        ),
      ),
    );
  }
}
