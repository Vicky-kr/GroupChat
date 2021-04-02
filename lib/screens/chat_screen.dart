import 'package:flutter/material.dart';
import 'package:group_chat/instance/firebase_instance.dart';
import 'package:group_chat/widgets/bottom_navigation_chat.dart';
import 'package:group_chat/widgets/message_bubble.dart';
import 'package:group_chat/widgets/message_stream.dart';
import 'package:group_chat/widgets/show_error.dart';

class ChatScreen extends StatefulWidget {
  final email;

  ChatScreen(this.email);

  @override
  _ChatScreenState createState() => _ChatScreenState(email);
}


class _ChatScreenState extends State<ChatScreen> {
  final email;

  _ChatScreenState(this.email);

  @override
  Widget build(BuildContext context) {
    FirebaseInstance(context).getMessage();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Group Chat',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Container(
            padding: EdgeInsets.only(right: 20),
            child: IconButton(
              disabledColor: Colors.white,
              onPressed: () {
                FirebaseInstance(context).doLogout();
              },
              icon: Icon(Icons.logout),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Expanded(
                child:MessageStream(),
              ),
              BottomNavigation(email)
            ],
          ),
        ),
      ),
    );
  }
}
