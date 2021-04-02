import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:group_chat/instance/firebase_instance.dart';
import 'package:group_chat/widgets/message_bubble.dart';

final _firestore = FirebaseFirestore.instance;

class MessageStream extends StatelessWidget {


  @override
  Widget build(BuildContext context) {


    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection("Messages").orderBy('time',descending: false).snapshots(),//to be uncomment if gets any error
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        final currentUser = FirebaseAuth.instance.currentUser.email;
        List<MessageBubble> messageWidgets = [];
        if (snapshot.hasData) {
          final messages = snapshot.data.docs.reversed;
          for (var message in messages) {
            final messageData = message.data();
            final messageText = messageData['message'];
            final messageSender = messageData['user'];

            final messageBubble = MessageBubble(
              text: messageText,
              isMe: currentUser == messageSender,
            );
            messageWidgets.add(messageBubble);
          }
        }

        return Expanded(
          child: ListView(
            reverse: true, //this automatically brings us to latest message
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            children: messageWidgets,
          ),
        );
      },
    );
  }
}
