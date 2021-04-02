import 'package:flutter/material.dart';

class TextInputLayout extends StatelessWidget {
  final TextInputType keyboardType;
  final String labelText;
  final bool obscureText;
  final Function onChanged;

  TextInputLayout(
      {this.keyboardType, this.labelText, this.obscureText, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
      ),
      onChanged: onChanged,
    );
  }
}

// class TextInputLayoutPassword extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       obscureText: true,
//       decoration: InputDecoration(
//         labelText: 'Password',
//       ),
//       onChanged: (value) {},
//       onSaved: (String value) {
//         // This optional block of code can be used to run
//         // code when the user saves the form.
//       },
//     );
//   }
// }
