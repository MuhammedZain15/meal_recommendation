import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../core/services/firebase_auth_service.dart';

class FirebaseAuthServiceImpl implements FirebaseAuthService {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  const FirebaseAuthServiceImpl({required this.auth, required this.firestore});

  @override
  Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final credential = await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return credential.user;
  }

  @override
  Future<User?> signInWithGoogle() async {
    final googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return (await auth.signInWithCredential(credential)).user;
  }

  @override
  Future<User?> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final credential = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return credential.user;
  }

  @override
  Stream<User?> authStateChanges() => auth.authStateChanges();

  @override
  User? get currentUser => auth.currentUser;

  @override
  Future<void> logOut() async {
    await auth.signOut();
  }

  @override
  Future<void> saveUserData(String uid, Map<String, dynamic> data) async {
    await firestore.collection('users').doc(uid).set(data);
  }
}
