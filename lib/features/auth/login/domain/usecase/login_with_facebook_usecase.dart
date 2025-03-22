import 'package:firebase_auth/firebase_auth.dart';
import 'package:meal_recommendation/features/auth/login/domain/repository/login_repository.dart';

class LoginWithFacebookUsecase {
  final LoginRepository repository;
  LoginWithFacebookUsecase(this.repository);

  Future<User?> call() {
    return repository.loginWithFacebook();
  }
}
