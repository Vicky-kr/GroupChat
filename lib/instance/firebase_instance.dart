import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:group_chat/screens/chat_screen.dart';
import 'package:group_chat/widgets/message_bubble.dart';
import 'package:group_chat/widgets/show_error.dart';

class FirebaseInstance {
  final BuildContext context;


  FirebaseInstance(this.context);

  void doRegisteration(String email, String confirmPassword) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: email, password: confirmPassword);
      if (userCredential.user != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatScreen(userCredential.user.email),
          ),
        );
        // print(userCredential.user.uid);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ShowError(context).showError(e.code);
        // print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        ShowError(context).showError(e.code);
        // print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  void doLogin(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {

        ///Alert box to join the old group or create new Group

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatScreen(userCredential.user.email.toString()),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      ShowError(context).showError(e.code);
    } catch (e) {
      print(e);
    }
  }

  void doLogout() {
    FirebaseAuth.instance.signOut().then((value) {
      Navigator.pop(context);
    });
  }

  void doMessaging(String message, DateTime time, String username) {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    CollectionReference reference = _firestore.collection("Messages");//to be uncomment if gets any error
    reference
        .add({
          'message': message, // John Doe
          'user': username, // Stokes and Sons
          'time': time // 42
        })
        .then((value) => print("Sent Successfully"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  List<Object> getMessage(){
    // Stream collectionStream = FirebaseFirestore.instance.collection('Messages').snapshots();
    FirebaseFirestore.instance
        .collection("Messages") // if any error occurs remove group name and add Messages
        .get()
        .then((QuerySnapshot querySnapshot) {
          return querySnapshot.docs.toList();
      // querySnapshot.docs.forEach((doc) {
      //   print(doc["message"]);
      // });
    });
  }


}
