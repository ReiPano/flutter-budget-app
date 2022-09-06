import 'package:flutter/material.dart';

class RoundedButtom extends StatefulWidget {
  final Color color;
  final String text;
  final VoidCallback press;
  const RoundedButtom(
      {Key? key, required this.color, required this.text, required this.press})
      : super(key: key);
  @override
  State<RoundedButtom> createState() => _RoundedButtomState();
}

class _RoundedButtomState extends State<RoundedButtom> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      width: size.width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(2),
        child: ElevatedButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(vertical: 20, horizontal: 40)),
            backgroundColor: MaterialStateProperty.all(widget.color),
          ),
          onPressed: widget.press,
          child: Text(
            widget.text,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
