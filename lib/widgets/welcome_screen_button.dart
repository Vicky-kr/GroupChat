import 'package:flutter/material.dart';

class WelcomeScreenButton extends StatelessWidget {
  final title;
  final Function onPressed;

  WelcomeScreenButton({this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      hoverColor: Colors.blueAccent,
      minWidth: 150.0,
      color: Colors.lightBlue,
      onPressed: onPressed,
      child: Text(title),
    );
  }
}
