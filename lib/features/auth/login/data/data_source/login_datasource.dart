import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class LoginDataSource {
  Future<User?> loginWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<User?> loginWithGoogle();
  Future<User?> loginWithFacebook();
  Future<void> saveUserToFirestore(User user);
}

class LoginDataSourceImpl implements LoginDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;

  LoginDataSourceImpl(this.firebaseAuth, this.firestore);

  @override
  Future<User?> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final user = await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return user.user!;
  }

  @override
  Future<User?> loginWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) return null;

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    UserCredential userCredential = await firebaseAuth.signInWithCredential(
      credential,
    );
    return userCredential.user;
  }

  @override
  Future<User?> loginWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();
    if (result.status != LoginStatus.success) return null;

    final OAuthCredential credential = FacebookAuthProvider.credential(
      result.accessToken!.tokenString,
    );

    UserCredential userCredential = await firebaseAuth.signInWithCredential(
      credential,
    );
    return userCredential.user;
  }

  @override
  Future<void> saveUserToFirestore(User user) async {
    final userDoc = firestore.collection("users").doc(user.uid);
    DocumentSnapshot snapshot = await userDoc.get();
    if (!snapshot.exists) {
      await userDoc.set({
        "uid": user.uid,
        "name": user.displayName ?? "New User",
        "email": user.email,
        "photoURL": user.photoURL ?? "",
        "createdAt": FieldValue.serverTimestamp(),
      });
    }
  }
}
