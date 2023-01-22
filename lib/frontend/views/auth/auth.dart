import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => firebaseAuth.authStateChanges();

  void logUserIn({
    required String email,
    required String password,
  }) async {
      await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
  }

  void signUserUp({
    required String email,
    required String password,
  }) async {
      await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
  }

  void logUserOut() {
    firebaseAuth.signOut;
  }
  
}
