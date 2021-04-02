import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:group_chat/widgets/text_input_layout.dart';
import 'package:group_chat/widgets/textfield_checker.dart';
import 'package:group_chat/widgets/welcome_screen_button.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatelessWidget {
  static String email;
  static String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
              padding: EdgeInsets.only(left: 30.0, right: 30.0),
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
                  TextInputLayout(
                    keyboardType: TextInputType.emailAddress,
                    obscureText: false,
                    onChanged: (value) {
                      email = value;
                    },
                    labelText: 'Email',
                  ),
                  TextInputLayout(
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    onChanged: (value) {
                      password = value;
                    },
                    labelText: 'Password',
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  WelcomeScreenButton(
                    title: 'Login',
                    onPressed: () {
                       TextFieldCheckerLog(
                              email: email,
                              password: password,
                              context: context)
                          .checkLogin();
                    },
                  )
                ],
              )),
        ),
      ),
    );
  }
}
