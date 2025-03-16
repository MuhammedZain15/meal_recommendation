import '../entities/user entity.dart';
import '../repository/register_repository.dart';

class SignInWithFacebook {
  final AuthRepository repository;

  SignInWithFacebook({required this.repository});

  Future<UserEntity> call() {
    return repository.signInWithFacebook();
  }
}
