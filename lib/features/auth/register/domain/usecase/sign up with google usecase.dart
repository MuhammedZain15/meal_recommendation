import '../entities/user entity.dart';
import '../repository/register_repository.dart';

class SignInWithGoogle {
  final AuthRepository repository;

  SignInWithGoogle({required this.repository});

  Future<UserEntity> call() {
    return repository.signInWithGoogle();
  }
}
