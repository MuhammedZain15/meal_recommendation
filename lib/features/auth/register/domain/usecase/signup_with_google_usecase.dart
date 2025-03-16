import '../entities/user entity.dart';
import '../repository/register_repository.dart';

class SignInWithGoogle {
  final AuthRepository repository;

  SignInWithGoogle(this.repository);

  Future<UserEntity> execute() {
    return repository.signInWithGoogle();
  }
}
