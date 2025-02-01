import 'package:flutter/material.dart';

class MyPostTile extends StatelessWidget {
  final String postText;
  final String userEmail;
  final String timestamp;
  const MyPostTile({
    super.key,
    required this.postText,
    required this.userEmail,
    required this.timestamp,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 25,
      ),
      padding: const EdgeInsets.symmetric(vertical:25),
      decoration: BoxDecoration(
        
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).colorScheme.secondary,
            width: 2,
          ),
        ),

      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            postText,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(userEmail),
              Text(timestamp),
            ],
          ),
        ],
      ),
    );
  }
}
