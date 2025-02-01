import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String post;
  final String uid;
  final String email;
  final Timestamp timestamp;

  Post({
    required this.post,
    required this.uid,
    required this.email,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return {
      'post': post,
      'uid': uid,
      'email': email,
      'timestamp': timestamp,
    };
  }
}
