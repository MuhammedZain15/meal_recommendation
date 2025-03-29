import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meal_recommendation/core/error/failure.dart';

import 'package:meal_recommendation/features/auth/login/domain/repository/login_repository.dart';

class LoginWithGoogleUseCase {
  final LoginRepository repository;

  LoginWithGoogleUseCase(this.repository);

  Future<Either<Failure, User>> execute() {
    return repository.signInWithGoogle();
  }
}
