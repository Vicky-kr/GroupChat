import 'package:flutter/material.dart';

class ShowSuccess {
  BuildContext context;
  final String message;
  ShowSuccess(this.context, this.message);

  void showSuccess() {
    String messages = message;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Success!"),
          content: Text("User was successfully ${messages}!"),
          actions: <Widget>[
            new FlatButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
