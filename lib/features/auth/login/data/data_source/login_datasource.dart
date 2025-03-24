import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meal_recommendation/core/error/custom_exception.dart';

abstract class LoginDataSource {
  Future<User> loginWithEmailAndPassword(String email, String password);
  Future<User> loginWithGoogle();
}

class LoginDataSourceImpl implements LoginDataSource {
  @override
  Future<User> loginWithEmailAndPassword(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (error) {
      log(
        'FirebaseAuthException.signInWithEmailAndPassword: ${error.toString()}',
      );
      if (error.code == 'invalid-credential') {
        throw CustomException('Email or password is incorrect.');
      } else if (error.code == 'invalid-credential') {
        throw CustomException('Email or password is incorrect.');
      } else {
        throw CustomException('An error occurred while signing in.');
      }
    } catch (error) {
      log('Error: ${error.toString()}');
      throw CustomException('An error occurred while signing in.');
    }
  }

  @override
  Future<User> loginWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
    await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }
}