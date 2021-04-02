import 'package:flutter/material.dart';

class JoinGroup {
  BuildContext context;

  JoinGroup({this.context});

  void showGroup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Please Select"),
          content: Container(
            height: 100.0,
            child: Column(
              children: [
                TextButton(
                    onPressed: () {
                      showKeyboard("Group Name");
                    },
                    child: Text(
                      'Create a new Group',
                    )),
                TextButton(
                  onPressed: () {
                    showKeyboard("Group Name");
                  },
                  child: Text(
                    'Join an existing Group',
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void showKeyboard(String msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Enter Group name"),
          content: TextFormField(
            decoration: InputDecoration(
              labelText: msg,
            ),
            onChanged: (value) {
              print(value);
            },
          ),
          actions: <Widget>[
            Row(
              children: [
                FlatButton(
                  child: const Text("Cancel"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                SizedBox(
                  width: 20.0,
                ),
                FlatButton(
                  child: const Text("Join"),
                  onPressed: () {
                    // Navigator.of(context).pop();


                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
