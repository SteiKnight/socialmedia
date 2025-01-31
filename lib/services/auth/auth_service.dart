import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  //initialize firebase auth
  FirebaseAuth auth = FirebaseAuth.instance;

  //sign in with email and password

  Future<void> signIn(String email, password) async {
    try {
await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //sign out
  Future<void> signOut() async {
    await auth.signOut();
  }
}
