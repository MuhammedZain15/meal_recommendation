import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../../core/error/failure.dart';
import '../repository/login_repository.dart';

class LoginWithEmailAndPasswordUseCase {
  final LoginRepository repository;

  LoginWithEmailAndPasswordUseCase(this.repository);

  Future<Either<Failure, User>> execute(String email, String password) {
    return repository.signInWithEmailAndPassword(email, password);
  }
}
