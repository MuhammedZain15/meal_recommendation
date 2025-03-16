import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../shared/model/user_model.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repository/register_repository.dart';
import '../data_source/register_datasource.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final RegisterRemoteDataSource remoteDataSource;

  RegisterRepositoryImpl({required this.remoteDataSource});

  @override
  Future<UserEntity> signUpWithEmail({
    required String email,
    required String password,
    required String username,
    required String phone,
  }) async {
    try {
      return await remoteDataSource.signUpWithEmail(
        email: email,
        password: password,
        username: username,
        phone: phone,
      );
    } catch (e) {
      throw Exception("Sign-up failed: $e");
    }
  }

  @override
  Future<UserEntity> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) throw Exception("Google Sign-In canceled");

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(credential);
      final User? user = userCredential.user;
      if (user == null) throw Exception("Google Sign-In failed");

      // Check if user exists in Firestore
      final docSnapshot =
          await FirebaseFirestore.instance
              .collection("users")
              .doc(user.uid)
              .get();

      if (!docSnapshot.exists) {
        final newUser = UserModel(
          uid: user.uid,
          username: user.displayName ?? "No Name",
          email: user.email!,
          phone: user.phoneNumber ?? "",
          password: "", // Google users don’t have a password
        );

        await FirebaseFirestore.instance
            .collection("users")
            .doc(user.uid)
            .set(newUser.toJson());
        return newUser;
      }

      return UserModel.fromFirebase(docSnapshot.data()!);
    } catch (e) {
      throw Exception("Google Sign-In failed: $e");
    }
  }

  @override
  Future<UserEntity> signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      if (result.status != LoginStatus.success) {
        throw Exception("Facebook login failed");
      }

      final AuthCredential credential = FacebookAuthProvider.credential(
        result.accessToken!.tokenString,
      );
      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(credential);
      final User? user = userCredential.user;
      if (user == null) throw Exception("Facebook Sign-In failed");

      // Check if user exists in Firestore
      final docSnapshot =
          await FirebaseFirestore.instance
              .collection("users")
              .doc(user.uid)
              .get();

      if (!docSnapshot.exists) {
        final newUser = UserModel(
          uid: user.uid,
          username: user.displayName ?? "No Name",
          email: user.email!,
          phone: user.phoneNumber ?? "",
          password: "", // Facebook users don’t have a password
        );

        await FirebaseFirestore.instance
            .collection("users")
            .doc(user.uid)
            .set(newUser.toJson());
        return newUser;
      }

      return UserModel.fromFirebase(docSnapshot.data()!);
    } catch (e) {
      throw Exception("Facebook Sign-In failed: $e");
    }
  }
}
