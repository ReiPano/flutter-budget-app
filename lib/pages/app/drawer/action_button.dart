import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton(
      {super.key, required this.actionTitle, required this.icon});
  final String actionTitle;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        const Divider(
          height: 1,
        ),
        SizedBox(
          width: size.width,
          child: TextButton(
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: size.width,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Icon(icon),
                    ),
                    Text(
                      actionTitle,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const Divider(
          height: 1,
        ),
      ],
    );
  }
}
