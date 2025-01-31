import 'package:flutter/material.dart';
import 'package:socialmedia/pages/home_page.dart';
import 'package:socialmedia/pages/login_page.dart';
import 'package:socialmedia/services/auth/auth_service.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
            stream: AuthService().auth.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return HomePage();
              }
              else {
                return LoginPage();
              }
            },),);
  }
}
