import '../entities/user_entity.dart';
import '../repository/register_repository.dart';

class SignInWithGoogleUseCase {
  final RegisterRepository repository;

  SignInWithGoogleUseCase(this.repository);

  Future<UserEntity> execute() {
    return repository.signInWithGoogle();
  }
}
