import 'package:firebase_auth/firebase_auth.dart';

import '../repository/login_repository.dart';

class LoginWithGoogleUsecase {
  final LoginRepository repository;
  LoginWithGoogleUsecase(this.repository);

  Future<User?> call() {
    return repository.loginWithFacebook();
  }
}
