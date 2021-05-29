import 'package:flutter/material.dart';
import 'button_calculator.dart';

class RowButtons extends StatelessWidget {
  RowButtons(this.text, this.color, this.pressedValue);
  final Color color;
  final String text;
  final Function pressedValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            child: CircleAvatar(
              backgroundColor: color,
              child: Text(
                text,
                style: TextStyle(fontSize: 30.0),
              ),
              radius: 40.0,
            ),
            onTap: () {
              pressedValue(text);
            },
          ),
        ],
      ),
    );
  }
}
