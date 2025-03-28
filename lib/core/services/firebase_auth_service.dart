import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseAuthService {
  Future<void> loginWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> registerWithEmailAndPassword({
    required String email,
    required String password,
  });
  Stream<User?> authStateChanges();

  User? get currentUser;

  Future<void> logOut();
}
