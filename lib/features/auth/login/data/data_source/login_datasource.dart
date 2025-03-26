import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/error/custom_exception.dart';
import '../../../../../core/services/firebase_utils.dart';

abstract class LoginDataSource {
  Future<User> loginWithEmailAndPassword(String email, String password);
  Future<User> loginWithGoogle();
}

class LoginDataSourceImpl implements LoginDataSource {
  final FirebaseService firebaseService;

  LoginDataSourceImpl(this.firebaseService);

  @override
  Future<User> loginWithEmailAndPassword(String email, String password) async {
    try {
      final user = await firebaseService.signInWithEmailAndPassword(
        email,
        password,
      );
      if (user == null) throw CustomException('Login failed.');
      await saveUserIdLocally(user.uid);
      return user;
    } on FirebaseAuthException catch (error) {
      log(
        'FirebaseAuthException.signInWithEmailAndPassword: ${error.toString()}',
      );
      throw CustomException('Email or password is incorrect.');
    } catch (error) {
      log('Error: ${error.toString()}');
      throw CustomException('An error occurred while signing in.');
    }
  }

  @override
  Future<User> loginWithGoogle() async {
    final user = await firebaseService.signInWithGoogle();
    await saveUserIdLocally(user?.uid);
    if (user == null) throw CustomException("Google Sign-In failed");
    return user;
  }

  Future<void> saveUserIdLocally(String? userId) async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      await sharedPreferences.setString('userId', userId ?? '');
    } catch (error) {
      throw CustomException('Failed to save user ID locally.');
    }
  }
}
