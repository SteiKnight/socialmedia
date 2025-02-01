import 'package:flutter/material.dart';
import 'package:socialmedia/components/my_drawer.dart';
import 'package:socialmedia/services/auth/auth_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //authService instance
  AuthService auth = AuthService();

  //signOut function
  void signOut() {
    auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('H O M E'),
        centerTitle: true,
        actions: [
          IconButton(icon: Icon(Icons.logout), onPressed: signOut),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [Text("data")],
          ),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
