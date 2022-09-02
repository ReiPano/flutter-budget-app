import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Receip extends StatefulWidget {
  const Receip({Key? key}) : super(key: key);

  @override
  State<Receip> createState() => _ReceipState();
}

class _ReceipState extends State<Receip> {
  @override
  Widget build(BuildContext context) {
    return Text("Receip");
  }
}