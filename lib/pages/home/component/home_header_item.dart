import 'package:flutter/material.dart';

class HomeHeaderItem extends StatefulWidget {
  const HomeHeaderItem({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<HomeHeaderItem> createState() => _HomeHeaderItemState();
}

class _HomeHeaderItemState extends State<HomeHeaderItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Text(
            widget.title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Text('0 LEK'),
        Text('0 EURO')
      ],
    );
  }
}
