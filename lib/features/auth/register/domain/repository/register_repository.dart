import '../entities/user entity.dart';

abstract class AuthRepository {
  Future<UserEntity> signUpWithEmail(
      String email, String password, String username, String phone);
  Future<UserEntity> signInWithGoogle();
  Future<UserEntity> signInWithFacebook();
}
