import 'package:flutter/material.dart';
import 'package:group_chat/instance/firebase_instance.dart';
import 'package:group_chat/widgets/show_error.dart';

class BottomNavigation extends StatefulWidget {
  final username;

  BottomNavigation(this.username);

  @override
  _BottomNavigationState createState() => _BottomNavigationState(username);
}

class _BottomNavigationState extends State<BottomNavigation> {
  final username;

  _BottomNavigationState(this.username);

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Type your message',
              ),
              controller: controller,
            ),
          ),
          SizedBox(
            width: 30.0,
          ),
          CircleAvatar(
            child: Center(
              child: FlatButton(
                onPressed: () {
                  if (controller.text.trim().toString().isNotEmpty) {
                    FirebaseInstance(context).doMessaging(
                        controller.text.trim().toString(),
                        DateTime.now(),
                        username);
                    controller.clear();
                  } else {
                    ShowError(context)
                        .showError("Message field cannot be empty");
                  }
                  //Send the message
                },
                child: Center(
                  child: Icon(
                    Icons.send,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
