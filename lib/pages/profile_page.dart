import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:socialmedia/components/my_post_tile.dart';
import 'package:socialmedia/components/post_board.dart';
import 'package:socialmedia/services/auth/auth_service.dart';
import 'package:socialmedia/services/posts/post_service.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  // post services
  PostService postServices = PostService();

  @override
  Widget build(BuildContext context) {
    AuthService authService = AuthService();
    return Scaffold(
      appBar: AppBar(
        title: Text('P R O F I L E'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            // Profile Picture
            Container(
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.person,
                size: 60,
              ),
            ),

            SizedBox(
              height: 10,
            ),

            // Name
            Text(
              authService.getCurrentUser!.email!.split('@')[0],
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),

            SizedBox(
              height: 10,
            ),

            // Email
            Text(
              authService.getCurrentUser!.email!,
            ),

            SizedBox(
              height: 25,
            ),

            // Posts
            PostBoard(stream: postServices.getPostsByUser()),
          ],
        ),
      ),
    );
  }
}
