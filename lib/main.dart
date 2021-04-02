import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:group_chat/screens/chat_screen.dart';
import 'package:group_chat/screens/login_screen.dart';
import 'package:group_chat/screens/register_screen.dart';
import 'package:group_chat/screens/welcome_screen.dart';

void main() {
  // ParseInstance parseInstance = ParseInstance();
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen()//ChatScreen(),
    );
  }
}
