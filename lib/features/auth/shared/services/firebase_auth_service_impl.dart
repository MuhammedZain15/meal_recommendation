import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/services/firebase_auth_service.dart';


class FirebaseAuthServiceImpl implements FirebaseAuthService {
  final FirebaseAuth firebaseAuth;
  const FirebaseAuthServiceImpl(this.firebaseAuth);

  @override
  Future<void> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> registerWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Stream<User?> authStateChanges() =>firebaseAuth.authStateChanges();
  

  @override
  User? get currentUser => firebaseAuth.currentUser;

  @override
  Future<void> logOut() async {
    await firebaseAuth.signOut();
  }
}
