import 'package:flutter/material.dart';
import 'package:socialmedia/pages/login_page.dart';
import 'package:socialmedia/pages/register_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  //variable to keep track of the current page
  bool registered = false;

  //function to toggle between login and register page
  void toggleRegistered() {
    setState(() {
      registered = !registered;
    });
  }

  @override
  Widget build(BuildContext context) {
    //if registered is true, show login page
    if (registered) {
      return LoginPage(
        toggleRegistered: toggleRegistered,
      );
    }
    //if registered is false, show register page
    else {
      return RegisterPage(
        toggleRegistered: toggleRegistered,
      );
    }
  }
}
