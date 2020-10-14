import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String buttonText;
  final Function onPressFunc;

  AnswerButton(this.buttonText, this.onPressFunc);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(2),
      child: RaisedButton(
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
        onPressed: onPressFunc,
      ),
    );
  }
}