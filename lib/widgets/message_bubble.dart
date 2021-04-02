import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  // final String sender;
  final String text;
  final bool isMe;

  MessageBubble({this.text, this.isMe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Material(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
              bottomLeft: isMe ? Radius.circular(30.0) : Radius.circular(0.0),
              bottomRight: isMe ? Radius.circular(0.0) : Radius.circular(30.0),
            ),
            elevation: 3,
            color: isMe ? Colors.lightBlueAccent : Colors.white38,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Column(
                children: [
                  Text(
                    text,
                    style: TextStyle(fontSize: 17.0),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
