import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseAuthService {
  Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<User?> signUpWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<User?> signInWithGoogle();
  Future<void> saveUserData(String uid, Map<String, dynamic> data);
  Stream<User?> authStateChanges();

  User? get currentUser;

  Future<void> logOut();
}
