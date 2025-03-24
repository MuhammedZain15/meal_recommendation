import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meal_recommendation/core/error/failure.dart';

abstract class LoginRepository {
  Future<Either<Failure, User>> signInWithEmailAndPassword(
      String email,
      String password,
      );
  Future<Either<Failure, User>> signInWithGoogle();
}