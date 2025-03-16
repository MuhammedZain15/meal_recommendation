import '../entities/user entity.dart';
import '../repository/register_repository.dart';

class SignInWithFacebookUseCase {
  final RegisterRepository repository;

  SignInWithFacebookUseCase(this.repository);

  Future<UserEntity> execute() {
    return repository.signInWithFacebook();
  }
}
