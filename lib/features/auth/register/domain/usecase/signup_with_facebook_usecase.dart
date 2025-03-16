import '../entities/user entity.dart';
import '../repository/register_repository.dart';

class SignInWithFacebook {
  final AuthRepository repository;

  SignInWithFacebook(this.repository);

  Future<UserEntity> execute() {
    return repository.signInWithFacebook();
  }
}
