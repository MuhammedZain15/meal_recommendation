import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginRepository {
  Future<User?> loginWithEmailAndPassword({required String email, required String password});
  Future<User?> loginWithGoogle();
  Future<User?> loginWithFacebook();
  Future<void> saveUserToFirestore(User user);
  Future<void> saveToken(String token);
  Future<String?> getToken();
  Future<void> logout();
}
