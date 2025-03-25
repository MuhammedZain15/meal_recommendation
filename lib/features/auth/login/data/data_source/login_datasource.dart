import 'package:meal_recommendation/core/error/custom_exception.dart';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../core/services/firebase_utils.dart';

abstract class LoginDataSource {
  Future<User> loginWithEmailAndPassword(String email, String password);
  Future<User> loginWithGoogle();
}

class LoginDataSourceImpl implements LoginDataSource {
  final FirebaseService firebaseService;

  LoginDataSourceImpl({required this.firebaseService});

  @override
  Future<User> loginWithEmailAndPassword(String email, String password) async {
    try {
      final user = await firebaseService.signInWithEmailAndPassword(email, password);
      if (user == null) throw CustomException('Login failed.');
      return user;
    } on FirebaseAuthException catch (error) {
      log('FirebaseAuthException.signInWithEmailAndPassword: ${error.toString()}');
      throw CustomException('Email or password is incorrect.');
    } catch (error) {
      log('Error: ${error.toString()}');
      throw CustomException('An error occurred while signing in.');
    }
  }

  @override
  Future<User> loginWithGoogle() async {
    final user = await firebaseService.signInWithGoogle();
    if (user == null) throw CustomException("Google Sign-In failed");
    return user;
  }
}