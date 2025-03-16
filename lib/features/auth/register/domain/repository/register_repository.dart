
import '../entities/user entity.dart';

abstract class AuthRepository {
  Future<UserEntity> signUpWithEmail({
    required String email,
    required String password,
    required String username,
    required String phone,
  });
  Future<UserEntity> signInWithGoogle();
  Future<UserEntity> signInWithFacebook();
}
