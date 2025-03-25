import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meal_recommendation/core/error/failure.dart';
import 'package:meal_recommendation/features/auth/login/domain/repository/login_repository.dart';

class LoginWithEmailAndPasswordUseCase {
  final LoginRepository repository;

  LoginWithEmailAndPasswordUseCase(this.repository);

  Future<Either<Failure, User>> execute(String email, String password) {
    return repository.signInWithEmailAndPassword(email, password);
  }
}
