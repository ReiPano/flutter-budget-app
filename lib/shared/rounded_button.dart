import 'package:flutter/material.dart';

class RoundedButtom extends StatefulWidget {
  final Color color;
  final Color textColor;
  final String text;
  final VoidCallback press;
  final bool loading;
  const RoundedButtom(
      {Key? key,
      required this.color,
      required this.textColor,
      required this.text,
      required this.press,
      this.loading = false})
      : super(key: key);
  @override
  State<RoundedButtom> createState() => _RoundedButtomState();
}

class _RoundedButtomState extends State<RoundedButtom> {
  var style = const TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      width: size.width * 0.9,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(2),
        child: MaterialButton(
          color: widget.color,
          textColor: widget.textColor,
          disabledColor: widget.color,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          onPressed: widget.loading ? null : widget.press,
          child: widget.loading
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Text(
                        widget.text,
                        style: style,
                      ),
                    ),
                    SizedBox(
                      width: 19,
                      height: 19,
                      child: CircularProgressIndicator(
                        color: widget.textColor,
                        strokeWidth: 3,
                      ),
                    ),
                  ],
                )
              : Text(widget.text, style: style),
        ),
      ),
    );
  }
}
