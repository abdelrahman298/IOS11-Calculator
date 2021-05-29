import 'package:flutter/material.dart';
import 'mainPages.dart';

class ButtonCalc extends StatelessWidget {
  ButtonCalc(this.text, this.pressedValue);

  final String text;
  final Function pressedValue;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: CircleAvatar(
        child: Text(
          text,
          style: TextStyle(fontSize: 30.0),
        ),
        radius: 40.0,
      ),
      onTap: () {
        pressedValue(text);
      },
    );
  }
}
