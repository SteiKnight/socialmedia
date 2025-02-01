import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:socialmedia/models/post.dart';

class PostService {
  //auth and firestore instance
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //post a new post
  Future<void> post(String post) async {
    final uid = auth.currentUser!.uid;
    final email = auth.currentUser!.email!;
    final timestamp = Timestamp.now();

    //create a post object
    Post postItem =
        Post(post: post, uid: uid, email: email, timestamp: timestamp);

    //add message to the database
    try {
      await firestore.collection('Posts').add(postItem.toMap());
    } on FirebaseException catch (e) {
      throw Exception(e.code);
    }
  }

  //get posts by user
  Stream<List<Map<String, dynamic>>> getPostsByUser() {
    final uid = auth.currentUser!.uid;
    return firestore
        .collection('Posts')
        .where('uid', isEqualTo: uid)
        .orderBy('timestamp', descending: true)
        .snapshots()
        .handleError((error) {
      if (error is FirebaseException && error.code == 'failed-precondition') {
        // Handle the error by providing a link to create the index
        print('Firestore index required: https://console.firebase.google.com/');
      }
    }).map((snapshot) {
      return snapshot.docs.map((doc) {
        final post = doc.data();
        return post;
      }).toList();
    });
  }

  //get all posts
  Stream<List<Map<String, dynamic>>> getAllPosts() {
    return firestore
        .collection('Posts')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return doc.data();
      }).toList();
    });
  }

  //delete post
  Future<void> deletePost(String postID) async {
    await firestore.collection('Posts').doc(postID).delete();
  }

  //get all users
  Stream<List<Map<String, dynamic>>> getAllUsers() {
    return firestore.collection('Users').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final user = doc.data();

        return user;
      }).toList();
    });
  }
}
