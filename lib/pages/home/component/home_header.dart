import 'package:budget/pages/home/component/home_header_item.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Center(
        child: Card(
          child: Container(
            width: size.width * 0.95,
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                HomeHeaderItem(title: 'Totali'),
                HomeHeaderItem(title: 'Totali pa takse'),
                HomeHeaderItem(title: 'Totali i taksave'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
