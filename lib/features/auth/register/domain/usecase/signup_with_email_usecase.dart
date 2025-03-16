import '../entities/user entity.dart';
import '../repository/register_repository.dart';

class SignUpWithEmail {
  final AuthRepository repository;

  SignUpWithEmail(this.repository);

  Future<UserEntity> execute({
    required String email,
    required String password,
    required String username,
    required String phone,
  }) {
    return repository.signUpWithEmail(
      email: email,
      password: password,
      username: username,
      phone: phone,
    );
  }
}
