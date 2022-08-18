import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final Color fillColor;
  final double textSize;
  final Color textColor;
  final Function whenPressed;
  final double width;
  final double height;

  const CalculatorButton(
      {Key? key,
      required this.text,
      required this.fillColor,
      required this.textSize,
      required this.textColor,
      required this.whenPressed,
      required this.width,
      required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shape =
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0));
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: SizedBox(
        height: height,
        width: width,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 12.0,
            shape: shape,
            shadowColor: Colors.black.withOpacity(1),
            onPrimary: textColor,
            primary: fillColor,
            textStyle: TextStyle(
              fontSize: textSize,
            ),
          ),
          onPressed: () {
            whenPressed(text);
          },
          child: Text(text),
        ),
      ),
    );
  }
}
