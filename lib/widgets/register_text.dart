import 'package:flutter/material.dart';

class RegisterText extends StatelessWidget {
  final String label;
  final Function onChanged;
  final bool obSecure;
  final TextInputType type;

  RegisterText({this.label, this.onChanged, this.obSecure, this.type});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: type,
      obscureText: obSecure,
      onChanged: onChanged,
      decoration: InputDecoration(labelText: label),
    );
  }
}
