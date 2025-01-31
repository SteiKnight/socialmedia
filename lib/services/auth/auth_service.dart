import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  //initialize firebase auth
  FirebaseAuth auth = FirebaseAuth.instance;

  //sign in with email and password

  Future<UserCredential> signIn(String email, password) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //sign out
  Future<void> signOut() async {
    await auth.signOut();
  }
}
