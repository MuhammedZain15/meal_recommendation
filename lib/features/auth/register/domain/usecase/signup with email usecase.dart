import '../entities/user entity.dart';
import '../repository/register_repository.dart';

class SignUpWithEmail {
  final AuthRepository repository;

  SignUpWithEmail({required this.repository});

  Future<UserEntity> call(
      String email, String password, String username, String phone) {
    return repository.signUpWithEmail(email, password, username, phone);
  }
}
