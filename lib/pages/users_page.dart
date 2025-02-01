import 'package:flutter/material.dart';
import 'package:socialmedia/services/auth/auth_service.dart';
import 'package:socialmedia/services/posts/post_service.dart';

class UsersPage extends StatelessWidget {
  UsersPage({super.key});

  // post services
  final PostService postServices = PostService();
  final AuthService auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('U S E R S'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),

            //List of Users
            StreamBuilder(
                stream: postServices.getAllUsers(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text("Loading...");
                  }
                  if (snapshot.hasError) {
                    return Text("Error: ${snapshot.error}");
                  }
                  // return Listview
                  return Expanded(
                    child: ListView(
                      children: snapshot.data!
                          .map<Widget>(
                              (userData) => buildUserTile(userData, context))
                          .toList(),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }

  Widget buildUserTile(Map<String, dynamic> userData, BuildContext context) {
    final currentUser = auth.getCurrentUser!;

    if (currentUser.email != userData['email']) {
      return Container(
        margin: const EdgeInsets.only(left: 25, right: 25, bottom: 5),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          leading: Icon(Icons.person),
          title: Text(
            userData['email'],
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
