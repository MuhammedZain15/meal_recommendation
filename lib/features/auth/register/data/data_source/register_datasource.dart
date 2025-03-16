import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../shared/model/user_model.dart';

abstract class RegisterRemoteDataSource {
  Future<UserModel> signUpWithEmail({
    required String email,
    required String password,
    required String username,
    required String phone,
  });
  Future<UserModel> signInWithGoogle();
  Future<UserModel> signInWithFacebook();
}

class RegisterRemoteDataSourceImpl implements RegisterRemoteDataSource {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  RegisterRemoteDataSourceImpl({required this.auth, required this.firestore});

  @override
  Future<UserModel> signUpWithEmail({
    required String email,
    required String password,
    required String username,
    required String phone,
  }) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      if (user == null) throw Exception("User creation failed");

      await user.updateDisplayName(username);

      final userModel = UserModel(
        uid: user.uid,
        username: username,
        email: email,
        phone: phone,
        password: password,
      );
      await firestore.collection('users').doc(user.uid).set(userModel.toJson());

      return userModel;
    } catch (e) {
      throw Exception("Firebase Error: $e");
    }
  }

  @override
  Future<UserModel> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) throw Exception("Google Sign-In failed");

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final UserCredential userCredential = await auth.signInWithCredential(
      credential,
    );
    return UserModel(
      uid: userCredential.user!.uid,
      username: userCredential.user!.displayName ?? "",
      email: userCredential.user!.email!,
      phone: userCredential.user!.phoneNumber ?? "",
      password: "",
    );
  }

  @override
  Future<UserModel> signInWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();
    if (result.status != LoginStatus.success)
      throw Exception("Facebook login failed");

    final AuthCredential credential = FacebookAuthProvider.credential(
      result.accessToken!.tokenString,
    );
    final UserCredential userCredential = await auth.signInWithCredential(
      credential,
    );

    return UserModel(
      uid: userCredential.user!.uid,
      username: userCredential.user!.displayName ?? "",
      email: userCredential.user!.email!,
      phone: userCredential.user!.phoneNumber ?? "",
      password: "",
    );
  }
}
