import 'package:firebase_auth/firebase_auth.dart';
import 'package:meal_recommendation/core/error/failure.dart';

import '../../../../../core/services/firebase_auth_service.dart';

abstract class LoginDataSource {
  Future<User> loginWithEmailAndPassword(String email, String password);
  Future<User> loginWithGoogle();
}

class LoginDataSourceImpl implements LoginDataSource {
  final FirebaseAuthService firebaseService;

  LoginDataSourceImpl(this.firebaseService);

  @override
  Future<User> loginWithEmailAndPassword(String email, String password) async {
    final user = await firebaseService.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    if (user == null) throw const Failure('Login failed.');
    return user;
  }

  @override
  Future<User> loginWithGoogle() async {
    final user = await firebaseService.signInWithGoogle();
    if (user == null) throw const Failure("Google Sign-In failed");
    return user;
  }
}
