import '../entities/user entity.dart';
import '../repository/register_repository.dart';

class SignInWithGoogleUseCase {
  final AuthRepository repository;

  SignInWithGoogleUseCase(this.repository);

  Future<UserEntity> execute() {
    return repository.signInWithGoogle();
  }
}
