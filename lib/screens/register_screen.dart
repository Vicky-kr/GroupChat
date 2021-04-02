import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:group_chat/widgets/register_text.dart';
import 'package:group_chat/widgets/show_error.dart';
import 'package:group_chat/widgets/show_success.dart';
import 'package:group_chat/widgets/textfield_checker.dart';

class RegisterScreen extends StatelessWidget {
  static String email;
  static String password;
  static String confirmPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 30.0, right: 30.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: TypewriterAnimatedTextKit(
                    speed: Duration(milliseconds: 80),
                    text: ['Group Chat'],
                    textStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 45.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                SizedBox(height: 30.0),
                RegisterText(
                  type: TextInputType.emailAddress,
                  obSecure: false,
                  label: 'Email',
                  onChanged: (value) {
                    email = value;
                  },
                ),
                RegisterText(
                  type: TextInputType.text,
                  obSecure: true,
                  label: 'Password',
                  onChanged: (value) {
                    password = value;
                  },
                ),
                RegisterText(
                  type: TextInputType.text,
                  obSecure: true,
                  onChanged: (value) {
                    confirmPassword = value;
                  },
                  label: 'Confirm Password',
                ),
                SizedBox(
                  height: 30.0,
                ),
                FlatButton(
                  color: Colors.lightBlue,
                  hoverColor: Colors.blueAccent,
                  onPressed: () async {
                    /// todo : onClick Register stuff to do with Parse
                    TextFieldChecker(
                            email: email,
                            password: password,
                            confirmPassword: confirmPassword,
                            context: context)
                        .checkRegister();

                  },
                  child: Text('Register'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
