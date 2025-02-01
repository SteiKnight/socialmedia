import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:socialmedia/components/my_post_tile.dart';
import 'package:socialmedia/services/posts/post_service.dart';

class PostBoard extends StatelessWidget {
  Stream<Object?>? stream;

  PostBoard({
    super.key,
    required this.stream,
  });

  // post services
  PostService postServices = PostService();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(
          left: 10,
          right: 10,
          bottom: 10,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25)),
        ),
        child: Center(
          child: StreamBuilder(
              stream: stream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("No Posts...");
                }
                if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
                }
                return Expanded(
                  child: ListView(
                    children: (snapshot.data! as List<dynamic>)
                        .map<Widget>(
                          (userData) => MyPostTile(
                            postText: userData['post'],
                            userEmail: userData['email'],
                            timestamp: DateFormat('dd/MM/yyyy')
                                .format(userData['timestamp'].toDate()),
                          ),
                        )
                        .toList(),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
