import 'package:firebase_auth/firebase_auth.dart';
import 'package:meal_recommendation/features/auth/login/domain/repository/login_repository.dart';

class LoginWithEmailUsecase {
  final LoginRepository repository;
  LoginWithEmailUsecase(this.repository);

  Future<User?> call(String email, String password) {
    return repository.loginWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
