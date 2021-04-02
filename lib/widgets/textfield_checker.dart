import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:group_chat/instance/firebase_instance.dart';
import 'package:group_chat/widgets/show_error.dart';

class TextFieldChecker {
  final String email;
  final String confirmPassword;
  final String password;
  final BuildContext context;

  TextFieldChecker(
      {this.email, this.password, this.confirmPassword, this.context});

  void checkRegister() async{
    if (email != null &&
        confirmPassword == password &&
        confirmPassword != null &&
        password != null) {
      FirebaseInstance(context).doRegisteration(email, confirmPassword);
      // print('${email} ${password} ${confirmPassword}');
    }
    if (email == null && password != null && confirmPassword != null) {
      ShowError(context).showError("Please Enter your email");
    }
    if (email != null && confirmPassword != password) {
      ShowError(context)
          .showError("Password and Confirm Password should be same");
    }
    if (email == null && confirmPassword == null && password == null) {
      ShowError(context).showError("Please provide the necessary details");
    }
  }
}

class TextFieldCheckerLog {
  final String email;
  final String password;
  final BuildContext context;

  TextFieldCheckerLog({this.email, this.password, this.context});


  // if found any error remove bool and write void
  void checkLogin() {
    if (email != null && password != null) {

      /// todo : do the login stuff
       FirebaseInstance(context).doLogin(email, password);

      // ParseInstance().doLogin(email, password, context);
    }
    if (email == null && password == null) {
      ShowError(context).showError("Please Enter your Email and Password");


    }
    if (password == null && email != null) {
      ShowError(context).showError("Please Enter the Password");

    } else {
      if (email == null && password != null) {
        ShowError(context).showError("Please Enter your Email");

      }
    }
  }
}
